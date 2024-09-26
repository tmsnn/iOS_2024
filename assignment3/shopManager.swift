def display_menu():
    print("\nShopping List Menu:")
    print("1. Add item")
    print("2. Remove item")
    print("3. Display shopping list")
    print("4. Exit")

def add_item(shopping_list):
    item = input("Enter the item to add: ").strip()
    shopping_list.append(item)
    print(f"'{item}' has been added to the shopping list.")

def remove_item(shopping_list):
    item = input("Enter the item to remove: ").strip()
    if item in shopping_list:
        shopping_list.remove(item)
        print(f"'{item}' has been removed from the shopping list.")
    else:
        print(f"'{item}' is not in the shopping list.")

def display_list(shopping_list):
    if not shopping_list:
        print("Your shopping list is empty.")
    else:
        print("\nCurrent shopping list:")
        for index, item in enumerate(shopping_list, 1):
            print(f"{index}. {item}")

def main():
    shopping_list = []
    while True:
        display_menu()
        choice = input("Choose an option (1-4): ").strip()

        if choice == '1':
            add_item(shopping_list)
        elif choice == '2':
            remove_item(shopping_list)
        elif choice == '3':
            display_list(shopping_list)
        elif choice == '4':
            print("Exiting the application. Goodbye!")
            break
        else:
            print("Invalid option, please choose again.")

if __name__ == "__main__":
    main()
