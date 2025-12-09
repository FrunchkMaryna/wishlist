# --- Stage 1: Build (Збірка Vue.js за допомогою Node.js) ---
    FROM node:20-alpine as build-stage

    WORKDIR /app
    
    # Копіюємо налаштування залежностей та встановлюємо їх
    COPY package*.json ./
    RUN npm install
    
    # Копіюємо решту коду і виконуємо збірку (результат в папці 'dist')
    COPY . .
    RUN npm run build
    
    # --- Stage 2: Production (Фінальний Nginx образ) ---
    FROM nginx:alpine as production-stage
    
    # Копіюємо зібрані Vue-файли з build-stage в папку Nginx
    COPY --from=build-stage /app/dist /usr/share/nginx/html
    
    # Копіюємо наш оптимізований конфігураційний файл Nginx
    COPY nginx.conf /etc/nginx/conf.d/default.conf
    
    EXPOSE 80
    
    CMD ["nginx", "-g", "daemon off;"]