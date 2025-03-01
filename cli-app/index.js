const { Pool } = require('pg');

// PostgreSQL connection
const pool = new Pool({
  user: 'postgres', 
  host: 'localhost',
  database: 'conference_db', 
  password: 'mypetsally11', 
  port: 5432,
});

/**
 * Inserts a new session into the Sessions table.
 * 
 * @param {string} title - Title of the session
 * @param {number} speakerId - ID of the speaker presenting the session
 * @param {string} date - Date of the session (YYYY-MM-DD format)
 * @param {string} time - Time of the session (HH:MM format)
 */
async function insertSession(title, speakerId, date, time) {
  const client = await pool.connect();
  try {
    const query = `INSERT INTO sessions (title, speaker_id, date_time) VALUES ($1, $2, $3) RETURNING *`;
    const values = [title, speakerId, `${date} ${time}`];
    const result = await client.query(query, values);
    console.log('Session inserted:', result.rows[0]);
  } catch (err) {
    console.error('Error inserting session:', err.message);
  } finally {
    client.release();
  }
}

/**
 * Prints all sessions in the database to the console.
 */
async function displaySessions() {
  const client = await pool.connect();
  try {
    const result = await client.query('SELECT * FROM sessions ORDER BY date_time');
    console.table(result.rows);
  } catch (err) {
    console.error('Error displaying sessions:', err.message);
  } finally {
    client.release();
  }
}

/**
 * Updates an attendee's email address.
 * 
 * @param {number} attendeeId - ID of the attendee
 * @param {string} newEmail - New email address of the attendee
 */
async function updateAttendeeEmail(attendeeId, newEmail) {
  const client = await pool.connect();
  try {
    const query = `UPDATE attendees SET email = $1 WHERE id = $2 RETURNING *`;
    const values = [newEmail, attendeeId];
    const result = await client.query(query, values);
    if (result.rowCount > 0) {
      console.log('Attendee email updated:', result.rows[0]);
    } else {
      console.log('Attendee not found.');
    }
  } catch (err) {
    console.error('Error updating attendee email:', err.message);
  } finally {
    client.release();
  }
}

/**
 * Removes an attendee from the database along with their registrations.
 * 
 * @param {number} attendeeId - ID of the attendee to remove
 */
async function removeAttendee(attendeeId) {
  const client = await pool.connect();
  try {
    await client.query('BEGIN'); // Start transaction
    await client.query('DELETE FROM registrations WHERE attendee_id = $1', [attendeeId]);
    const result = await client.query('DELETE FROM attendees WHERE id = $1 RETURNING *', [attendeeId]);
    if (result.rowCount > 0) {
      console.log('Attendee removed:', result.rows[0]);
    } else {
      console.log('Attendee not found.');
    }
    await client.query('COMMIT'); // Commit transaction
  } catch (err) {
    await client.query('ROLLBACK'); // Rollback in case of error
    console.error('Error removing attendee:', err.message);
  } finally {
    client.release();
  }
}

/**
 * Prints a help message to the console.
 */
function printHelp() {
  console.log('Usage:');
  console.log('  insert <title> <speaker_id> <date> <time> - Insert a session');
  console.log('  show - Show all sessions');
  console.log('  update <attendee_id> <new_email> - Update an attendee\'s email');
  console.log('  remove <attendee_id> - Remove an attendee from the database');
}

/**
 * Runs the CLI app to manage the conference event system.
 */
async function runCLI() {
  const args = process.argv.slice(2);
  switch (args[0]) {
    case 'insert':
      if (args.length !== 5) {
        printHelp();
        return;
      }
      await insertSession(args[1], parseInt(args[2]), args[3], args[4]);
      break;
    case 'show':
      await displaySessions();
      break;
    case 'update':
      if (args.length !== 3) {
        printHelp();
        return;
      }
      await updateAttendeeEmail(parseInt(args[1]), args[2]);
      break;
    case 'remove':
      if (args.length !== 2) {
        printHelp();
        return;
      }
      await removeAttendee(parseInt(args[1]));
      break;
    default:
      printHelp();
      break;
  }
}

runCLI();

