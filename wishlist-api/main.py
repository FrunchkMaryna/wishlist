# ... (інші імпорти)
import redis
# ...

# --- СЕКЦІЯ ІНІЦІАЛІЗАЦІЇ REDIS ---

# Отримуємо повний URL з Render (він містить Host, Port, Password)
REDIS_URL = os.getenv("REDIS_URL") 

# Якщо ми в Production (на Render), використовуємо TLS/SSL
# Переконайтеся, що REDIS_URL містить 'rediss://' для SSL, якщо це необхідно.
if ENVIRONMENT == "production" and REDIS_URL:
    # Upstash зазвичай вимагає використання SSL/TLS
    redis_client = redis.from_url(
        REDIS_URL, 
        decode_responses=True,
        ssl_cert_reqs=None # Дозволяє підключення без перевірки сертифіката (простіше для деплою)
    )
else:
    # Локальна розробка
    REDIS_HOST = os.getenv("REDIS_HOST", "localhost")
    REDIS_PORT = os.getenv("REDIS_PORT", "6379")
    LOCAL_REDIS_URL = f"redis://{REDIS_HOST}:{REDIS_PORT}"
    
    redis_client = redis.from_url(
        LOCAL_REDIS_URL, 
        decode_responses=True
    )
# ...
