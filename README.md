# DiVenture

## 專案介紹
**DiVenture** 是一款專為潛水愛好者打造的潛水日誌平台，幫助使用者記錄每次潛水的詳細資訊，包含地點、時間、深度、氣瓶狀態、照片等。

## 主要功能
- **潛水紀錄管理**：
  - 記錄潛水地點、時間、最大深度、最冷水溫、能見度等
  - 紀錄潛水氣瓶殘壓、第幾隻氣瓶
  - 上傳潛水照片與個人評語
- **會員管理系統**：
  - 註冊 / 登入 

## 技術架構
- **前端**：JSP
- **後端**：Java + Servlet + JDBC + Tomcat 
- **資料庫**：MSSQL

## 📂 專案結構
```
diving_service/
├── src/
│   ├── main/
│   │   ├── java/com/diveplatform/
│   │   │   ├── controller/
│   │   │   ├── service/
│   │   │   ├── dao/
│   │   │   ├── entity/
│   │   │   ├── util/
│   │   ├── webapp/
│   │   │   ├── WEB-INF/
│   │   │   ├── views/
│   │   │   ├── assets/
│   │   │   ├── scripts/
│   │   │   ├── styles/
│   │   │   ├── index.jsp
├── database/
│   ├── schema.sql
├── README.md
└── .gitignore
```
