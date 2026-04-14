# Patient Management System

A high-performance healthcare platform built for scalability and robustness, delivering reliable patient data management at enterprise scale.

---

## Overview

Patient Management System represents a complete modernization of legacy healthcare software. Through architectural refinement, critical bug remediation, and strategic technology updates, we've created a production-ready platform that handles complex medical workflows with confidence.

---

## Core Features

### Architectural Excellence
- **Layered Design**: Four-tier separation of concerns (Domain → Core → Infrastructure → API) ensures clean, testable, and maintainable code
- **Recent Improvements**: A complete overhaul from outdated foundations with unified namespaces and type definitions across the entire codebase
- **Frontend Modernization**: Angular 17+ with reactive patterns and optimized architecture supporting future growth

### Production Readiness
- **Data Integrity**: Resolved endpoint mismatches and eliminated configuration hardcoding that caused runtime failures
- **Async-First**: Integrated token-based cancellation across the service pipeline for graceful shutdown and timeout handling
- **Robust API**: Standards-compliant error responses through global exception management
- **Input Safety**: Comprehensive validation framework preventing invalid data from entering the system

### Developer Experience
- **Consistent Mapping**: Unified DTOs and entity transformations via declarative mapping configurations
- **Observable Systems**: Event-driven logging with structured insights for troubleshooting and monitoring
- **Responsive UI**: Signal-centric state management for lightning-fast Angular component updates

---

## Technology Foundation

| Layer | Technologies |
|-------|---------------|
| **Server** | .NET 7, C#, SQL Server with Entity Framework Core |
| **Messaging** | MassTransit with RabbitMQ for distributed event processing |
| **Client** | Angular 17+, TypeScript, RxJS, Signals API |
| **Utilities** | FluentValidation, AutoMapper, ProblemDetails RFC support |

---

## Repository Layout

```
Root/
├── Patient-Management-System.sln
├── PatientInsight.Api/           ← REST endpoints, middleware, event handlers
├── PatientInsight.Core/          ← Business workflows (Services, Interfaces)
├── PatientInsight.Infrastructure/← Database access, Entity Framework, Migrations
├── PatientInsight.Domain/        ← Models, Value Objects, Data Contracts
├── PatientInsight.Tests/         ← Unit & integration test suite
└── PatientInsightUi/             ← Angular frontend application
```

---

## Quick Start Guide

### Prerequisites
- SQL Server connection configured in `appsettings.json`
- RabbitMQ service running or configured in settings

### Launch Instructions

**Backend Services:**
```bash
dotnet run --project PatientInsight.Api
```

**Frontend Application:**
```bash
cd PatientInsightUi
npm install
npm start
```

---

## License & Support

For questions, issues, or contributions, please refer to the project documentation and contribution guidelines.
