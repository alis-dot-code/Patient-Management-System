# PatientInsight (formerly AtlasPatient)

Enterprise-grade Patient Management System refactored for scale, resilience, and reliability.

## 🚀 Key Improvements

### 🏗️ Architecture & Rebranding
- **Transition**: Rebranded from `AtlasPatient` to `PatientInsight` across all projects, namespaces, and types.
- **Clean Architecture**: Restructured into four distinct layers (Domain, Core, Infrastructure, Api) to decouple business logic from external concerns.
- **Modern UI**: Angular 17+ standalone application with a scalable folder structure (Core, Shared, Features).

### 🛡️ Resilience & Reliability
- **Bug Fixes**:
  - Corrected swapped external API endpoints (Medications vs. Vaccinations).
  - Resolved hardcoded SSN bug in the message consumer.
- **Concurrency**: Propagated `CancellationToken` support throughout the entire stack (Controller -> Service -> Repository -> External HTTP).
- **Error Handling**: Implemented RFC-compliant `ProblemDetails` via a global exception middleware.
- **Validation**: Integrated `FluentValidation` for logic-based request checks.

### ⚡ Performance & Quality
- **AutoMapper**: Standardized object-to-object mapping.
- **Structured Logging**: Meaningful telemetry using parameter-based logging templates.
- **Signals**: Signal-based state management in the Angular UI for high-performance reactivity.

## 🛠️ Tech Stack

- **Backend**: .NET 7 (C#), Entity Framework Core (SQL Server)
- **Messaging**: MassTransit with RabbitMQ
- **Frontend**: Angular 17 (Standalone, Signals, RxJS)
- **Library**: FluentValidation, AutoMapper, ProblemDetails

## 📂 Project Structure

```text
/
├── PatientInsight.sln
├── PatientInsight.Api             # Web API, Controllers, Middleware, Consumers
├── PatientInsight.Core            # Interfaces, Business Logic (Services)
├── PatientInsight.Infrastructure  # DB Context, Repositories, Migrations
├── PatientInsight.Domain          # Entities, DTOs, Mapping Profiles
├── PatientInsight.Tests           # XUnit / Moq Unit Tests
└── PatientInsightUi/              # Angular 17 Frontend
```

## 🏁 Getting Started

1. **Database**: Update connection string in `appsettings.json`.
2. **Bus**: Ensure RabbitMQ is running or update `ServiceBus` config.
3. **Backend**: `dotnet run --project PatientInsight.Api`
4. **Frontend**: `cd PatientInsightUi && npm install && npm start`
