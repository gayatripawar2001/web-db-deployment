import os
import psycopg2

conn = psycopg2.connect(
        host="localhost",
        database="db",
        user=os.environ['DB_USERNAME'],
        password=os.environ['DB_PASSWORD'])

# Open a cursor to perform database operations
cur = conn.cursor()

# Execute a command: this creates a new table
cur.execute('DROP TABLE IF EXISTS books;')
cur.execute('CREATE TABLE books (id serial PRIMARY KEY,'
                                 'Name varchar (50) NOT NULL,'
                                 'age integer NOT NULL,:'
                               )

# Insert data into the table

cur.execute('INSERT INTO books (name, age)'
            'VALUES (%s, %s)',
            ('Gayatri',
             18)
            )


cur.execute('INSERT INTO books (name, age)'
            'VALUES (%s, %s)',
            ('krishna',
             20)
            )

conn.commit()

cur.close()
conn.close()