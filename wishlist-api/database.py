from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
import os
from dotenv import load_dotenv

# Завантажуємо .env лише для локальної розробки, 
# але на Render цей виклик ігнорується, і використовуються змінні оточення хоста
load_dotenv() 

# ---------------------------------------------------------------------
# --- ПРОДАКШН СТРАТЕГІЯ: ЧИТАННЯ ПОВНОЇ URL (RENDER) ---
# ---------------------------------------------------------------------

# 1. Спробуємо прочитати повний URL (це те, що ми встановили як DATABASE_URL на Render)
DATABASE_URL = os.getenv("DATABASE_URL")

# Якщо ми знаходимо DATABASE_URL, Render може надати її у форматі 'postgres://', 
# який SQLAlchemy не любить. Ми виправляємо це на 'postgresql://'.
if DATABASE_URL and DATABASE_URL.startswith("postgres://"):
    DATABASE_URL = DATABASE_URL.replace("postgres://", "postgresql://", 1)

# ---------------------------------------------------------------------
# --- ЛОКАЛЬНА СТРАТЕГІЯ: ФОРМУВАННЯ URL З ОКРЕМИХ ЗМІННИХ ---
# --- (Спрацює лише локально або якщо на Render не встановлено DATABASE_URL) ---
# ---------------------------------------------------------------------

if not DATABASE_URL:
    # Читаємо окремі змінні, які використовуються у Dev-конфігурації
    DB_USER = os.getenv("DB_USER")
    DB_PASSWORD = os.getenv("DB_PASSWORD")
    DB_HOST = os.getenv("DB_HOST", "localhost")
    DB_NAME = os.getenv("DB_NAME")
    
    # Формуємо URL з локальних змінних
    DATABASE_URL = f"postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}/{DB_NAME}"


# --- ВИВІД ЗМІННИХ ДЛЯ DEBUG (Збережено для діагностики) ---
# На Render буде виведено лише DATABASE_URL (або помилка, якщо її немає)
print(f"--- DB Configuration ---")
print(f"FINAL_URL_START: {DATABASE_URL[:40]}...") # Виводимо лише частину URL
print(f"--- End Configuration ---")


# --- ІНІЦІАЛІЗАЦІЯ SQLALCHEMY ---
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
