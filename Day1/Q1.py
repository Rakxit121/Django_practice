class Calculator:
    def calculate(self, operator, *numbers):
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

calc = Calculator()
print(calc.calculate('*', 1, 2, 3, 4))  # 10
