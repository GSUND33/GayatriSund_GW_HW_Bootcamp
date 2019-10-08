#House of pies
#establish the pie purchase and pie lists and still shopping variable
pies_purchased = []
still_shopping = "y"
pie_list = ["Pecan", "Apple Crisp", "Bean", "Banoffee", "Black Bun",
           "Blueberry", "Buko", "Burek", "Tamale", "Steak"]
#print house of pies welcome message and pies available
print("Welcome to the House of Pies! Here are our pies:")
#while still shopping for pies
while still_shopping == "y":
   print("-----------------------------------------------")
   print("(1) Pecan, (2) Apple Crisp, (3) Bean, (4) Banoffee, (5) Black Bun, (6) Blueberry, (7) Buko, (8) Burek, " +
     " (9) Tamale, (10) Steak ")
   #Prompt customer to select a pie
   pie_choice = input("Which kind of pie would you like (plese select by number reference)? ")
   #add to the pies purchased list
   pies_purchased.append(pie_choice)
   print("----------------------------------------------")
   #prompt the user with their choice of pie and let them know its being made
   print("Great! We'll get that " + pie_list[int(pie_choice) - 1] + " right out for you.")
   #Ask the user if they want another pie
   still_shopping = input("Would you like another pie? Enter (y) for yes and (n) for no. ")
   print("-------------------------------------------------")
   #list their complete order
print("You Purchased:")
#count the number of integer occurences of pies ordered then print them
pecan_count = pies_purchased.count('1')
print(f'{pecan_count} Pecan')
applecrisp_count = pies_purchased.count('2')
print(f'{applecrisp_count} Apple Crisp')
bean_count = pies_purchased.count('3')
print(f'{bean_count} Bean')
banoffee_count = pies_purchased.count('4')
print(f'{banoffee_count} Banoffee')
blackbun_count = pies_purchased.count('5')
print(f'{blackbun_count} Black Bun')
blueberry_count = pies_purchased.count('6')
print(f'{blueberry_count} Blueberry')
buko_count = pies_purchased.count('7')
print(f'{buko_count} Buko')
burek_count = pies_purchased.count('8')
print(f'{burek_count} Burek')
tamale_count = pies_purchased.count('9')
print(f'{tamale_count} Tamale')
steak_count = pies_purchased.count('10')
print(f'{steak_count} Steak')