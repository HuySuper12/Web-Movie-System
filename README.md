
# 🎬 CinemaHub - Online Movie Platform

CinemaHub is an advanced online movie system offering features such as HD movie viewing, ratings, comments, Premium subscriptions, and content/user management.

---

## 📌 Overview

CinemaHub provides users with:

- 📺 Watch trailers and high-quality movies.  
- 🔍 Search for and get movie recommendations by keyword/genre  
- 💬 Rate (rating), comment, and report content.  
- 💳 Register for Premium subscriptions with MoMo, VNPay, PayPal.  
- 🔐 Login with Google, Email, OTP 2FA.  
- 🛠️ Admin and Manager for content, statistics, and user management.

---

## 🎯 Project Goals

- ✅ Build a fully-featured movie streaming platform.  
- ✅ Optimize user and admin experience.  
- ✅ Manage content, users, subscriptions, and system reports.

---

## 📦 Project Scope

### ✅ Completed Features
- Movie trailers and streaming.  
- Movie search and recommendations by keyword/genre.  
- Account management and watch history.  
- Premium subscriptions.  
- User interaction: ratings, comments, reports.

### ❌ Not Implemented
- Exclusive movie content production.  
- Complex social media integrations (like/share).

---

## 👥 Stakeholders

| Role         | Description                                                                 |
|--------------|-----------------------------------------------------------------------------|
| 🎯 End Users | Watch, rate, comment, and subscribe to Premium.                             |
| 🛠️ Admin      | Manage content, moderate, handle violations, send warning emails.           |
| 👨‍💼 Manager    | Track statistics, monitor system performance, manage promotions and user roles. |
| 👨‍💻 Developer  | Design, develop, and operate the system.                                   |

---

## ⚙️ Core Features

### 👤 End Users
- Register/Login with Email, Phone, Google.  
- Watch trailers, select video quality and subtitles.  
- Watch history and favorites.  
- Rate movies (stars), comment, and report.  
- Premium payment via MoMo, VNPay, PayPal.  
- OTP 2FA for sensitive logins.

### 🛠️ Admin
- Upload and moderate movies.  
- Manage metadata: genre, description, actors, trailers.  
- Create/Manage Premium subscriptions.  
- Handle comments and user account violations.  
- Send warning emails and confirm Premium subscriptions.

### 👨‍💼 Manager
- Create movie announcements and promotions.  
- View statistics: revenue, user count, views.  
- Monitor system performance.  
- Moderate movies and subscription plans.

---

## 🔐 Non-Functional Requirements

| Criteria      | Description                                                                 |
|---------------|-----------------------------------------------------------------------------|
| 🚀 Performance | Basic performance optimizations implemented (compression, caching), but system has not been stress-tested for over 10,000 concurrent users. |
| ⚡ Speed       | Homepage loads in under 2 seconds on standard laptop screens (100% scale).  |
| 🔒 Security    | JWT, encryption, 2FA, and email verification implemented.                   |
| 📈 Scalability | Scalable architecture in place, but real-world scaling scenarios not yet tested. |

---

## 🧑‍💻 Technologies Used

| Component       | Technology                                      |
|-----------------|--------------------------------------------------|
| Frontend        | ReactJS, Redux, Firebase Auth                    |
| Backend         | ASP.NET Core, CQRS + MediatR                     |
| Database        | SQL Server, Redis Cache                          |
| Payments        | MoMo, VNPay, PayPal                              |
| Email           | Sending SMTP (MailKit)                           |
| Logging         | Serilog                                          |
| Background Jobs | HangFire                                         |
| Authentication  | JWT + Firebase + 2FA                             |

---

## 🧩 ASP.NET Core Middleware

| Middleware           | Description                                       |
|----------------------|---------------------------------------------------|
| ✅ Authentication     | JWT Token authentication                          |
| ✅ Authorization      | Role checking (User/Admin/Manager)               |
| ✅ Exception Handling | Global error handling and JSON response           |
| ✅ Logging            | Detailed logging of requests/responses            |
| ✅ CORS               | Allow frontend to access the API                  |
| ✅ Rate Limiting      | Limit the number of requests per IP              |

---

## ✉️ Email Sending via SMTP

Using MailKit to send system emails:

- 🔐 Send OTP for 2FA.  
- 📧 Send Premium subscription payment confirmation.  
- ⚠️ Send warnings and account lock notifications.  
- Supports Gmail SMTP or enterprise SMTP.

---

## 📊 Monitoring & Statistics Tools

| Tool              | Purpose                                |
|-------------------|----------------------------------------|
| 🔍 HangFire       | Monitor background jobs (email, backups). |
| 📈 SQL Profiler   | Track heavy SQL queries.               |
| 📝 Serilog        | Detailed logging by timestamp.         |

---

## 🏗️ Clean Architecture

- 📁 **Domain**: Entity, Enum, Validation Rules  
- 📁 **Application**: Business Logic (CQRS, MediatR)  
- 📁 **Infrastructure**: DB, Mail, Cache, Payment  
- 📁 **API**: Controller, Middleware, Logging, Auth
