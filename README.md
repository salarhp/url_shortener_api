# URL Shortener Backend (Rails API)

This is the backend component of the URL Shortener challenge. It is a Ruby on Rails API-only application that supports creating, storing, and redirecting shortened URLs.

## 📦 Requirements

- Ruby 3.4.3
- Rails 8.0.2
- PostgreSQL

## 🚀 Setup Instructions

1. **Clone the repository:**

```bash
git clone https://github.com/salarhp/url_shortener_api
cd url_shortener_api
```

2. **Install Ruby gems:**

```bash
bundle
```

3. **Create and migrate the database:**

```bash
bin/rails db:setup
```

4. **Start the Rails server:**

```bash
bin/rails s
```

The backend will be running at `http://localhost:3000`.

---

## 🔗 API Endpoints

### `GET /api/v1/links`
Returns a list of shortened URLs for the current (mocked) user.

### `POST /api/v1/links`
Create a new short URL.

#### Example Payload:
```json
{
  "link": {
    "original_url": "https://example.com",
    "slug": "custom-slug",           // optional
    "expires_at": "2025-06-01T12:00", // optional
    "status": 0                       // 0: active, 1: inactive, 2: archived
  }
}
```

### `GET /:slug`
Redirects to the original URL and increments click count.

---

## 🧪 Running Tests

RSpec is used for testing.

1. **Run all tests:**

```bash
bundle exec rspec
```

Includes tests for:
- Link model
- API controller
- Redirect logic

---

## 👤 Mock Authentication

Authentication is mocked via a `current_user` method in `ApplicationController`. All actions assume a fixed user ID.
