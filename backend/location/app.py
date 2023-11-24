import json
import pymysql
from geopy.distance import geodesic

statusCode = 0

def lambda_handler(event, context):

    global statusCode
    conn = pymysql.connect( 
            host="172.17.0.2",
            user="root",
            password="toor",
            database="market"
        )

    if event['httpMethod'] == 'GET':
        if event['pathParameters']:
            id = event['pathParameters']['marketId']
            cur = conn.cursor()
            cur.execute(f"SELECT * FROM location WHERE id={id}") 
            output = cur.fetchall()

            if output:
                statusCode = 200
                response = {     
                   "id":  output[0][0],
                   "name": output[0][3],
                   "lat": float(output[0][1]),
                   "log": float(output[0][2])
                }          

            else:
                statusCode = 404
                response = {
                    "message" : "Not Found!"
                }

        else:

            try:
                range = int(event['queryStringParameters']['range'])
                lat = float(event['queryStringParameters']['lat'])
                log = float(event['queryStringParameters']['log'])

                response = GET(conn, range, lat, log)
            
            except: 
                response = GET(conn)
        
    elif event['httpMethod'] == 'PUT':
        try:
            name = event['queryStringParameters']['name']
            lat = float(event['queryStringParameters']['lat'])
            log = float(event['queryStringParameters']['log'])        

            response = PUT(conn, name, lat, log)
            
        except:
            
            statusCode = 400
            response = {
                "message" : "Paramenters Missing!"
            }
            
    conn.close() 

    return {
        "statusCode": statusCode,
        "body": json.dumps(response),
    }


def GET(conn, range = None, lat = 0.0, log = 0.0):
    cur = conn.cursor()
    result = list()
    global statusCode

    print(range, lat, log)

    cur.execute("SELECT * FROM location") 
    output = cur.fetchall() 

    if range:
        for i in output:
            if calc_distance(lat, log, float(i[1]), float(i[2])) <= range:
                result.append(
                {
                    "id": i[0],
                    "name": i[3],
                    "lat": float(i[1]),
                    "log": float(i[2])
                }
            )

    else:
        for i in output: 
            result.append(
                {
                    "id": i[0],
                    "name": i[3],
                    "lat": float(i[1]),
                    "log": float(i[2])
                }
            )

    print(result, type(result))

    return result

def PUT(conn, name, lat, log):
    global statusCode
    cur = conn.cursor()

    try:
        cur.execute(f"INSERT INTO location (lat, log, name) VALUES ({lat}, {log}, '{name}')")
        conn.commit()

    except:
        statusCode = 400
        return {
            "message" : "Duplicate Values"
        }
    
    cur.execute(f"SELECT * FROM location WHERE lat={lat} AND log={log}") 
    output = cur.fetchall()

    statusCode = 201
    return {
    
        "id":  output[0][0],
        "name": name,
        "lat": lat,
        "log": log
    }

def calc_distance(lat1, lon1, lat2, lon2):
    coordenada1 = (lat1, lon1)
    coordenada2 = (lat2, lon2)
    return geodesic(coordenada1, coordenada2).kilometers
