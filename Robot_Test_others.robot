        ------------------------ Evaluate keyword in robot framework --------------------------------

# The Code:
${result}=    Evaluate    [x.strip() for x in $my_list if x]

# The Explanation:

# Evaluate opens a "Python portal" to run native code inside Robot Framework.
# $my_list passes the actual list object to Python (using `$` instead of `${}` prevents errors).
# The Brackets [] tell Python to create a new list by looping through, cleaning (`strip`), and filtering the data in one line.
# In the expression [x.strip() for x in $my_list if x], the if x acts as a truthiness filter that automatically excludes empty strings, 
#         None values, or zeros from the final list, ensuring only items with actual content are processed.


