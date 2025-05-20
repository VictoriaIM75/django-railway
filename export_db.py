import pymysql

def export_database(host, user, password, db_name, output_file):
    connection = pymysql.connect(
        host=host,
        user=user,
        password=password,
        database=db_name,
        charset='utf8mb4',
        cursorclass=pymysql.cursors.DictCursor
    )
    
    with connection.cursor() as cursor, open(output_file, 'w', encoding='utf8') as f:
        # Obtener todas las tablas
        cursor.execute("SHOW TABLES")
        tables = [row[f'Tables_in_{db_name}'] for row in cursor.fetchall()]
        
        for table in tables:
            # Exportar estructura
            cursor.execute(f"SHOW CREATE TABLE `{table}`")
            create_table = cursor.fetchone()['Create Table']
            f.write(f"{create_table};\n\n")
            
            # Exportar datos
            cursor.execute(f"SELECT * FROM `{table}`")
            rows = cursor.fetchall()
            for row in rows:
                columns = ', '.join(f"`{col}`" for col in row.keys())
                values = ', '.join(connection.escape(value) for value in row.values())
                f.write(f"INSERT INTO `{table}` ({columns}) VALUES ({values});\n")
            f.write("\n")
    
    connection.close()
    print(f"Exportación completada en archivo {output_file}")

if __name__ == '__main__':
    export_database(
        host='localhost',        # Cambia aquí
        user='root',             # Cambia aquí
        password='',  # Cambia aquí
        db_name='djangodb',      # Cambia aquí
        output_file='djangodb_dump.sql'
    )
