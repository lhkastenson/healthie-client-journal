# Healthie Rails API

A Rails API modeling providers, clients, enrollments, and health journal entries.

## Setup

### Requirements

- Ruby 3.x (see `.ruby-version`)
- Docker and Docker Compose

### Getting Started

**1. Start the database**

```bash
docker compose up -d
```

**2. Install dependencies**

```bash
bundle install
```

**3. Create and migrate the database**

```bash
rails db:create
rails db:migrate
```

**4. (Optional) Seed sample data**

```bash
rails db:seed
```

**5. Run the test suite**

```bash
bundle exec rspec
```

## Data Model

### Provider
Represents a health provider such as a dietitian. Has a name and email address. Can have many clients through enrollments.

### Client
Represents a patient or client. Has a name and email address. Can have many providers through enrollments, and can post journal entries.

### Enrollment
Join model between Provider and Client. Each enrollment has a plan — either `basic` or `premium`. A client cannot be enrolled with the same provider more than once.

### JournalEntry
Freeform text entries posted by a client. Sorted by creation date.

## Queries

Each model exposes class methods for the key queries:

| Method | Description |
|--------|-------------|
| `Provider.clients_for(provider_id)` | All clients for a given provider |
| `Provider.journal_entries_for(provider_id)` | All journal entries across all clients of a given provider, sorted by date |
| `Client.providers_for(client_id)` | All providers for a given client |
| `Client.journal_entries_for(client_id)` | All journal entries for a given client, sorted by date |