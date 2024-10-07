import tkinter as tk
from tkinter import messagebox

class Calculator:
    def calculate(self, operator, numbers):
        try:
            result = numbers[0]
            for num in numbers[1:]:
                if operator == '+':
                    result += num
                elif operator == '-':
                    result -= num
                elif operator == '*':
                    result *= num
                elif operator == '/':
                    result /= num
                else:
                    raise ValueError("Invalid operator")
            return result
        except Exception as e:
            return f"Error: {e}"

def perform_calculation():
    try:
        # Get the operator and numbers from input fields
        operator = operator_var.get()
        nums = [float(num) for num in number_entry.get().split()]

        # Check if at least 2 numbers are entered
        if len(nums) < 2:
            messagebox.showerror("Input Error", "Please enter at least two numbers.")
            return

        # Perform calculation
        calc = Calculator()
        result = calc.calculate(operator, nums)
        
        # Display the result
        result_label.config(text=f"Result: {result}")

    except ValueError:
        messagebox.showerror("Input Error", "Please enter valid numeric values.")
    except ZeroDivisionError:
        messagebox.showerror("Math Error", "Cannot divide by zero.")

# Create the main window
root = tk.Tk()
root.title("Simple Calculator")
root.geometry("400x300")

# Label and entry for numbers
tk.Label(root, text="Enter numbers (separated by spaces):").pack(pady=10)
number_entry = tk.Entry(root, width=30)
number_entry.pack()

# Dropdown for operator selection
tk.Label(root, text="Select an operator:").pack(pady=10)
operator_var = tk.StringVar(value='+')
operator_dropdown = tk.OptionMenu(root, operator_var, '+', '-', '*', '/')
operator_dropdown.pack()

# Button to perform calculation
calculate_button = tk.Button(root, text="Calculate", command=perform_calculation)
calculate_button.pack(pady=20)

# Label to display the result
result_label = tk.Label(root, text="Result: ", font=("Helvetica", 14))
result_label.pack(pady=20)

# Start the GUI loop
root.mainloop()






# class Calculator:
#     def calculate(self, operator, *numbers):
#         try:
#             result = numbers[0]
#             for num in numbers[1:]:
#                 if operator == '+':
#                     result += num
#                 elif operator == '-':
#                     result -= num
#                 elif operator == '*':
#                     result *= num
#                 elif operator == '/':
#                     result /= num
#                 else:
#                     raise ValueError("Invalid operator")
#             return result
#         except Exception as e:
#             return f"Error: {e}"

# def get_operator():
#     operators = ['+', '-', '*', '/']
#     while True:
#         operator = input("Enter the operator (+, -, *, /): ")
#         if operator in operators:
#             return operator
#         else:
#             print("Invalid operator! Please enter one of +, -, *, or /.")

# def get_numbers():
#     while True:
#         try:
#             numbers = input("Enter the numbers separated by spaces: ").split()
#             numbers = [float(num) for num in numbers]  # Convert all inputs to floats
#             if len(numbers) < 2:
#                 print("Please enter at least two numbers.")
#             else:
#                 return numbers
#         except ValueError:
#             print("Invalid input! Make sure to enter numeric values.")

# def display_ui():
#     print("="*30)
#     print("WELCOME TO PYTHON CALCULATOR")
#     print("="*30)
    
#     operator = get_operator()
#     numbers = get_numbers()

#     calc = Calculator()
#     result = calc.calculate(operator, *numbers)

#     print("="*30)
#     print(f"Result: {result}")
#     print("="*30)

# if __name__ == "__main__":
#     display_ui()

