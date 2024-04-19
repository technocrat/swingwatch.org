using Dates
using DataFrames
using HTTP
using MySQL

"""
CREATE TABLE IF NOT EXISTS polls (
    id INT AUTO_INCREMENT PRIMARY KEY,
    state VARCHAR(255)    COMMENT 'Name of state',
    pollster VARCHAR(255) COMMENT 'Name of the pollster',
    typepoll VARCHAR(255) COMMENT 'Poll type',
    pub_date DATE         COMMENT 'Date of the poll',
    start_date DATE       COMMENT 'Start date of polling',
    end_date DATE         COMMENT 'End date of polling',
    url VARCHAR(255)      COMMENT 'URL of the poll',
    n INTEGER             COMMENT 'Sample size (in respondents)',
    biden FLOAT           COMMENT 'Biden support',
    trump FLOAT           COMMENT 'Trump support',
    third FLOAT           COMMENT 'Third-party support',
    sserept FLOAT         COMMENT 'Reported sample standard error',
    design_err FLOAT      COMMENT 'Design effect',
    other_err FLOAT       COMMENT 'Unspecified error',
    moe FLOAT             COMMENT 'Margin of error',
    ssecalc FLOAT         COMMENT 'Calculated [sub]sample standard error',
    deadj FLOAT           COMMENT 'Design effect adj [sub]sample st error',
    moeadj FLOAT          COMMENT 'Total adjusted margin of error',
    leadr VARCHAR(255)    COMMENT 'Poll leader (Biden,Trump,Third,None)'
    );
"""
# Database connection details
const HOST     = "localhost"
const USER     = "swing"
const PASSWORD = "swing"
const DATABASE = "swing"
const TABLE    = "polls"

# Connect to the MariaDB database
conn = DBInterface.connect(MySQL.Connection, HOST, USER, PASSWORD, db=DATABASE)

# Define the date range
start_date = Date("2024-01-01")
end_date   = Date("2024-12-31")
pub_date   = Date("2024-04-04")

# Read data from the database within the date range into a DataFrame
query = """
    SELECT *
    FROM $TABLE
    WHERE pub_date = "2024-04-04"
"""


# Execute the query and fetch the results into a DataFrame
df = DataFrame(DBInterface.execute(conn, query))

"""
# Perform calculations in Julia
df.sse = sqrt.(df.n)  # Calculate simple random sampling error
df.total_support = df.biden .+ df.trump .+ df.third  # Calculate total support


update_query = """
  UPDATE data_entries
  SET poll = ?, url = ?, n = ?, biden = ?, trump = ?, third = ?,
     type = ?, sserept = ?, de = ?, other = ?, tot = ?,
     ssecalc = ?, deadj = ?, totadj = ?, leadr = ?
  WHERE date = ?
  """
stmt = DBInterface.prepare(conn, update_query)
DBInterface.execute(stmt, [
  row.poll, row.url, row.n, row.biden, row.trump, row.third,
  row.type, row.sserept, row.de, row.other, row.tot,
  row.ssecalc, row.deadj, row.totadj, row.leadr, row.date
])
# Write the updated DataFrame back to the database
for row in eachrow(df)
    update_query = """
        UPDATE data_entries
        SET poll = ?, url = ?, n = ?, biden = ?, trump = ?, third = ?,
            type = ?, sserept = ?, de = ?, other = ?, tot = ?,
            ssecalc = ?, deadj = ?, totadj = ?, leadr = ?
        WHERE date = ?
    """
    MySQL.execute(conn, update_query, [
        row.poll, row.url, row.n, row.biden, row.trump, row.third,
        row.type, row.sserept, row.de, row.other, row.tot,
        row.ssecalc, row.deadj, row.totadj, row.leadr, row.date
    ])
end
"""
# Close the database connection
MySQL.disconnect(conn)