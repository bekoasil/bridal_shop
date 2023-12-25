from datetime import datetime
import psycopg2
import random

connection = psycopg2.connect(
    host = "localhost", 
    port="5432", 
    database="postgres", 
    user="postgres", 
    password="mysecretpassword")

cur = connection.cursor()

print('''
_______________________________________________________________________________________________________________
Hoşgeldin!
Randevu oluşturmak için: 1
Randevunu görüntülemek için: 2
_______________________________________________________________________________________________________________
''')
user_input = input()
if user_input == '2':
    phone_number = input("Randevunuzu görüntülemek için telefon numaranızı (05XXYYYZZWW) girin: ")

    phone_number_query = f"""SELECT a.appointment_date FROM customers c INNER JOIN appointments a ON c.customer_id = a.customer_id INNER JOIN salesperson sp ON a.salesperson_id = sp.salesperson_id WHERE phone = '{phone_number}'"""
    cur.execute(phone_number_query, (phone_number, ))
    user_appointment_date = cur.fetchone()
    user_appointment_date = user_appointment_date[0]
    
    time_interval_query = f"""SELECT a.time_interval FROM customers c INNER JOIN appointments a ON c.customer_id = a.customer_id INNER JOIN salesperson sp ON a.salesperson_id = sp.salesperson_id WHERE phone = '{phone_number}'"""
    cur.execute(time_interval_query, (phone_number, ))
    user_appointment_time = cur.fetchone()
    user_appointment_time = user_appointment_time[0]

    salesperson_name_query = f"""SELECT sp.salesperson_name FROM customers c INNER JOIN appointments a ON c.customer_id = a.customer_id INNER JOIN salesperson sp ON a.salesperson_id = sp.salesperson_id WHERE phone = '{phone_number}'"""
    cur.execute(salesperson_name_query, (phone_number, ))
    appointment_salesperson_name = cur.fetchone()
    appointment_salesperson_name = appointment_salesperson_name[0]

    salesperson_surname_query = f"""SELECT sp.salesperson_surname FROM customers c INNER JOIN appointments a ON c.customer_id = a.customer_id INNER JOIN salesperson sp ON a.salesperson_id = sp.salesperson_id WHERE phone = '{phone_number}'"""
    cur.execute(salesperson_surname_query, (phone_number, ))
    appointment_salesperson_surname = cur.fetchone()
    appointment_salesperson_surname = appointment_salesperson_surname[0]

    print('%s %s tarihindeki randevunuzda sizinle %s %s ilgilenecektir.' % (user_appointment_date, user_appointment_time, appointment_salesperson_name, appointment_salesperson_surname))

    cur.close()
    connection.close()
    
else:
    print('''
    _______________________________________________________________________________________________________________
    Randevu oluşturmak bazı bilgilerine ihtiyacımız var.
    Sırayla bilgilerini girebilir misin?
    _______________________________________________________________________________________________________________
    ''')

    name = input('İsim: ')
    surname = input('Soyad: ')
    phone = input('Telefon: ')
    email = input('Email: ')

    insert_customer_script = 'INSERT INTO customers (customer_name, customer_surname, phone, email) VALUES (%s, %s, %s, %s)'
    insert_customer_value = (name, surname, phone, email)

    cur.execute(insert_customer_script, insert_customer_value)

    connection.commit() #commitlemezsen db'e gitmez

    print('')


    print('Merhaba %s hangi tarihte randevu istersin?' % name)
    date = input('Tarih (YYYY-AA-GG): ')

    cur.execute("SELECT max(customer_id) FROM customers")
    customer_id = cur.fetchone()
    if customer_id:
        # Extract the value from the tuple
        customer_id = int(customer_id[0])
    else:
        print("Öncelikle müşteri kaydını tamamlamalısın.")

    cur.execute("SELECT COUNT(*) FROM salesperson")
    salesperson_amount = cur.fetchone()
    salesperson_id = random.randint(1,salesperson_amount[0])

    available_intervals_query = f"""SELECT * FROM appointments WHERE appointment_date = '{date}' AND salesperson_id = '{salesperson_id}'""" #Uc tirnak kullanarak string 
    cur.execute(available_intervals_query, (date, ))
    nonavailable_intervals = cur.fetchall()

    '''available_intervals_query = 'SELECT * FROM appointments WHERE appointment_date = %s'
    cur.execute(available_intervals_query, (date, ))
    nonavailable_intervals = cur.fetchall()'''

    print('Seçtiğiniz tarihde şu saatler doludur: ')
    for i in nonavailable_intervals:
        print(i[3])

    time_interval = input('\n Zaman aralığı girin: ') #varolan bir zaman araliginda girerse hata ver ve yeniden girdir

    cur.execute("SELECT * FROM product_type") 
    product_types = cur.fetchall()
    for i in product_types:
        print(i[0],'.',i[1])
    product_type_selection = input('Hangi tipte ürün denemek istersin?  ')

    insert_appointment_script = 'INSERT INTO appointments (customer_id, appointment_date, time_interval, product_type_selection, salesperson_id) VALUES (%s, %s, %s, %s, %s)'
    insert_appointment_value = (customer_id, date, time_interval, product_type_selection, salesperson_id)

    cur.execute(insert_appointment_script, insert_appointment_value)

    connection.commit() #commitlemezsen db'e gitmez

    print('''
    Randevunuz başarıyla oluşturulmuştur.
    Görüşmek üzere...''')


    '''cur.execute("SELECT max(customer_id) FROM customers")
    last_customer_id = cur.fetchone()
    print(last_customer_id)'''

    #cur.execute("SELECT * FROM customers")

    #rows = cur.fetchall()

    #for r in rows:
    #    print(r)

    cur.close()
    connection.close()