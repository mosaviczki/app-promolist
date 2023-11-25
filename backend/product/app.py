import json
import pymysql

statusCode = 0

def lambda_handler(event, context):
 
    conn = pymysql.connect( 
            host="172.17.0.2",
            user="root",
            password="toor",
            database="market"
        )

    if event['pathParameters']:
        id = event['pathParameters']['marketId']
        cur = conn.cursor()
        cur.execute(f"SELECT * FROM products WHERE id_location={id}") 
        output = cur.fetchall()

        if output:
            statusCode = 200

            if event['body']:
                response = filterProduct(conn, id, event['body'])
            else:
                response = dict()

                print(output)

                for i in output:
                    print(i, type(i))
                    response[i[2]] = float(i[3])
                print(response, type(response))
        else:
            statusCode = 404
            response = {
                "message" : "Not Found!"
            }

    conn.close()

    return {
        "statusCode": statusCode,
        "body": json.dumps(response)
    }

def filterProduct(conn, id, body):
    cur = conn.cursor()
    body = json.loads(body)
    response = dict()

    for i in body:
        cur.execute(f"SELECT * FROM products WHERE id_location={id} AND LOWER(name) LIKE LOWER('{i}%')")
        output = cur.fetchall()
        
        if output:
            response[output[0][2]] = float(output[0][3])     
        else:
            response[i] = None

    return response