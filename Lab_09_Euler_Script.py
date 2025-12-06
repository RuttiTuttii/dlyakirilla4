# Лабораторная работа №9: Метод Эйлера
# Вариант 14

def f(x, y):
    # Дифференциальное уравнение: y' = y/x - 3x
    return (y / x) - 3 * x

def main():
    print("--- Решение ДУ методом Эйлера ---")
    
    x0 = 1.0
    y0 = -2.0
    target_x = 2.0
    h = 0.1
    
    print(f"Уравнение: y' = y/x - 3x")
    print(f"Начальные условия: y({x0}) = {y0}")
    print(f"Интервал: [{x0}, {target_x}]")
    print(f"Шаг h: {h}")
    
    n_steps = int((target_x - x0) / h + 0.5) # +0.5 для корректного округления
    
    x = x0
    y = y0
    
    print("\nТаблица значений:")
    print(f"x = {x:.1f}, y = {y:.4f}")
    
    for i in range(n_steps):
        # Формула Эйлера: y_{i+1} = y_i + h * f(x_i, y_i)
        y_next = y + h * f(x, y)
        x_next = x + h
        
        x = x_next
        y = y_next
        
        print(f"x = {x:.1f}, y = {y:.4f}")

if __name__ == "__main__":
    main()
