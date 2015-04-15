import math
import check

#Question 4:
    
## Defined constant - phone_str, del_str	
## Use these string in your solution to avoid misspelled strings

phone_str = "Phone number %d is already in the existing customer records" 
del_str ="No record found with phone number %d"

##*************************************************************************
## Part A: add_record

# add_record: customer_list customer_list -> None

# Purpose: produces none by consuming two customer_record list (all_records)
# (cust_record)

# Effect: Mutates (all_records) by adding (cust_record) to it if the phone 
# number stored in (cust_record) is not in (all_records)

# Examples: Calling add_record([["cust1","kitchener",5192345647]], \
# ["cust2", "cambridge", 5192345647), it produces None but all_records 
# becomes [["cust1", "kitchener", 5192345647], ["cust2", "cambridge", 5192345647]]

def add_record(all_records,cust_record):
	phone_record = map(lambda list: list[2], all_records)
	new_phone = cust_record[2]
	check_new = filter(lambda ph_num: ph_num == new_phone, phone_record)
	if check_new == []:
		return all_records.append(cust_record)
	else:
		print phone_str % new_phone

# Tests
## adding a phone number 
all_records = [["cust1","kitchener",5192345647]] 
check.expect("Q4t1", add_record(all_records,["cust2","cambridge",5193243456]), None)
check.set_screen([["cust1", "kitchener", 5192345647], \
                  ["cust2", "cambridge", 5192345647]])
## phone number already exists
all_records = [["cust1","kitchener",5192345647]]
check.expect("Q4t2", add_record(all_records, \
                                ["cust2","cambridge",5192345647]), None)
check.set_screen("Phone number 5192345647 is already in the exisiting customer records")

##**************************************************************************

# delete_record: customer_list phone -> None

# Purpose: produces none by consuming a listof customer_record (all_records)
# and a 10-digit phone number(phone)

# Effect: Mutates (all_records) by deleting the entry with phone number
# (phone)

# Example: Calling delete_record([["cust1","kitchener",5192345647], 
# ["cust2","cambridge",5193243456]], 5192345647), it produces None 
# but all_records becomes [["cust2","cambridge",5193243456]]
# Calling delete_record([["cust1","kitchener",5192345647]],5193243456),
# it produces None but prints "No record found with phone number 5193243456"

def delete_record(all_records,phone):
	phone_record = map(lambda list: list[2], all_records)
	check_new = filter (lambda ph_num: ph_num == phone, phone_record)
	if check_new == []:
		print del_str % phone
	else:
		remove = phone_record.index(phone)
		all_records.pop(remove)
		return all_records
	
# Tests
## deleting a phone number
all_records = [["cust1","kitchener",5192345647], ["cust2","cambridge",5193243456]]
check.expect("Q4t3", delete_record(all_records, 5192345647), None)
check.set_screen([["cust2","cambridge",5193243456]])
## phone number does not exist
all_records = [["cust1","kitchener",5192345647]]
check.expect("Q4t4", delete_record(all_records, 5193243456), None)
check.set_screen("No record found with phone number 5193243456")
	
##***************************************************************************

# view_records: customer_list phone -> customer_list

# Purpose: produces a listof customer_record by consuming a listof
# customer_record(all_records) and a 10-digit phone number(phone)

# Effect: Mutates (all_records) if the given (phone) matches or only
# mistakes the first or last digit of it

# Examples: If all_records=[["Cust1","Kitchener",5192345647],
# ["Cust2","Cambridge",5193243456],["Cust3","Waterloo",5192345648],
# ["Cust4","Guelph",5192344589]], calling view_records(all_records,5192345648) 
# produces [['Cust3', 'Waterloo', 5192345648]]

#If all_records=[["Cust1","Kitchener",5192345647],
# ["Cust2","Cambridge",5193243456],["Cust3","Waterloo",5192345648],
# ["Cust4","Guelph",5192343527]], calling view_records(all_records,5192345649) 
# produces[['Cust1', 'Kitchener', 5192345647], ['Cust3', 'Waterloo', 5192345648]]

#If all_records=[["Cust1","Kitchener",5192345647],
# ["Cust2","Cambridge",5193243456],["Cust3","Waterloo",5192345648],
# ["Cust4","Guelph",5192344589]], calling view_records(all_records,5199875645) 
# produces[]

def view_records(all_records,phone):
	record_list = filter(lambda l: l[2]==phone,all_records)
	if record_list !=[]:
		return record_list
	else:
		f=(lambda l: (l[2]/10) == (phone/10))
		g=(lambda l: (l[2]%10**9) ==( phone%10**9))
		new_record = filter(f,all_records) + filter(g,all_records)
		return new_record
	
# Tests
all_records=[["Cust1","Kitchener",5192345647],["Cust2","Cambridge",5193243456],\
             ["Cust3","Waterloo",5192345648],["Cust4","Guelph",5192344589]]
check.expect("Q3r31", view_records(all_records,5192345648), \
             [['Cust3', 'Waterloo', 5192345648]])

all_records=[["Cust1","Kitchener",5192345647],["Cust2","Cambridge",5193243456],\
             ["Cust3","Waterloo",5192345648],["Cust4","Guelph",5192343527]]
check.expect("W3r32", view_records(all_records,5192345649), \
             [['Cust1', 'Kitchener', 5192345647], ['Cust3', 'Waterloo', 5192345648]])


all_records=[["Cust1","Kitchener",5192345647],["Cust2","Cambridge",5193243456],\
             ["Cust3","Waterloo",5192345648],["Cust4","Guelph",5192344589]]
check.expect(view_records(all_records,5199875645), [])