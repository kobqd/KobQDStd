from booking.booking import Booking

try:
    with Booking(teardown=True) as bot:
        2/0
        bot.land_first_page()
except Exception as e:
    if 'in PATH' in str(e):
        print("Err:" + e)
    else:
        raise

# pip install prettytable
# from prettytable import PrettyTable
# table = PrettyTable(
#     field_names = ["name", "price", "score"]
# )
# table.add_rows(list)
# print(table)