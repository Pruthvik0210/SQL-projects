import tkinter as tk
from tkinter import *
import mysql.connector

mydb = mysql.connector.connect(host="000.0.0.0", user="xxx", passwd = "#########", database = "project_1", auth_plugin= "mysql_native_password")
cursor = mydb.cursor()

def adddept():
    cname1 = ent1.get()
    cname2 = ent2.get()
    cname3 = ent3.get()
    cname4 = ent4.get()

    sql = "INSERT INTO department VALUES(%s, %s, %s, %s)"
    cursor.execute(sql, (cname1,cname2,cname3,cname4))
    print("department record added")
    mydb.commit()
    return True

win = Tk()

frm1 = Frame(win)
frm1.pack(side=tk.LEFT, padx=20)



#1
var1 = StringVar()
cname1 = StringVar()

label1 = Label(frm1, textvariable = var1)
var1.set("Dname")
label1.grid(row=1, column=1)

ent1 = Entry(frm1, textvariable=cname1)
cname1.set("Enter Dname:")
ent1.grid(row=1, column=2)

#2
var2 = StringVar()
cname2 = StringVar()

label2 = Label(frm1, textvariable = var2)
var2.set("Dnumber")
label2.grid(row=2, column=1)

ent2 = Entry(frm1, textvariable=cname2)
cname2.set("Enter Dnumber")
ent2.grid(row=2, column=2)

#3
var3 = StringVar()
cname3 = StringVar()

label3 = Label(frm1, textvariable = var3)
var3.set("Mgr_SSN")
label3.grid(row=3, column=1)

ent3 = Entry(frm1, textvariable=cname3)
cname3.set("Enter Mgr_SSN:")
ent3.grid(row=3, column=2)

#4
var4 = StringVar()
cname4 = StringVar()

label4 = Label(frm1, textvariable = var4)
var4.set("Mgr_start_date")
label4.grid(row=4, column=1)

ent4 = Entry(frm1, textvariable=cname4)
cname4.set("Enter Mgr_start_date:")
ent4.grid(row=4, column=2)



btn = Button(frm1, text="Add Department Record", command = adddept)
btn.grid(row=5, column=2)

win.title("Department Form")
win.geometry("300x250")
win.mainloop()
