<div align="center">

# Shipwright

**Autonomous Product Development Life Cycle for Claude Code**

16 Skills + 138 Agents — research, plan, design, develop, test, deploy, review, and improve autonomously.

![Skills](https://img.shields.io/badge/skills-16-blue?style=flat-square)
![Agents](https://img.shields.io/badge/agents-138-green?style=flat-square)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](LICENSE)

</div>

> **Note:** The 138 agent definitions in this project are derived from [VoltAgent/awesome-claude-code-subagents](https://github.com/VoltAgent/awesome-claude-code-subagents), an open-source collection of Claude Code subagents. Shipwright extends them with 16 PDLC skills and a full autonomous sprint-based development orchestrator.

## Installation

### One-Liner Install (Recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/dipandhali2021/shipwright/main/install.sh | bash
```

Or from a cloned repo:
```bash
git clone https://github.com/dipandhali2021/shipwright && cd claude-code && bash install.sh
```

Installs all 16 skills + 138 agents + skills-lock.json to `.claude/`.

### Manual Installation

1. Clone this repository
2. Copy desired agent files to:
   - `~/.claude/agents/` for global access
   - `.claude/agents/` for project-specific use
3. Customize based on your project requirements

### Interactive Installer
```bash
git clone https://github.com/dipandhali2021/shipwright.git && cd shipwright
./install-agents.sh
```
Interactive TUI to browse and selectively install/uninstall agents.

## Agents

The 138 agents are organized into 10 categories below. All agents are derived from [VoltAgent/awesome-claude-code-subagents](https://github.com/VoltAgent/awesome-claude-code-subagents).

### [01. Core Development](agents/)
Essential development subagents for everyday coding tasks.

- [**api-designer**](agents/api-designer.md) - REST and GraphQL API architect
- [**backend-developer**](agents/backend-developer.md) - Server-side expert for scalable APIs
- [**electron-pro**](agents/electron-pro.md) - Desktop application expert
- [**frontend-developer**](agents/frontend-developer.md) - UI/UX specialist for React, Vue, and Angular
- [**fullstack-developer**](agents/fullstack-developer.md) - End-to-end feature development
- [**graphql-architect**](agents/graphql-architect.md) - GraphQL schema and federation expert
- [**microservices-architect**](agents/microservices-architect.md) - Distributed systems designer
- [**mobile-developer**](agents/mobile-developer.md) - Cross-platform mobile specialist
- [**ui-designer**](agents/ui-designer.md) - Visual design and interaction specialist
- [**websocket-engineer**](agents/websocket-engineer.md) - Real-time communication specialist

### [02. Language Specialists](agents/)
Language-specific experts with deep framework knowledge.
- [**typescript-pro**](agents/typescript-pro.md) - TypeScript specialist
- [**sql-pro**](agents/sql-pro.md) - Database query expert
- [**swift-expert**](agents/swift-expert.md) - iOS and macOS specialist
- [**vue-expert**](agents/vue-expert.md) - Vue 3 Composition API expert
- [**angular-architect**](agents/angular-architect.md) - Angular 15+ enterprise patterns expert
- [**cpp-pro**](agents/cpp-pro.md) - C++ performance expert
- [**csharp-developer**](agents/csharp-developer.md) - .NET ecosystem specialist
- [**django-developer**](agents/django-developer.md) - Django 4+ web development expert
- [**dotnet-core-expert**](agents/dotnet-core-expert.md) - .NET 8 cross-platform specialist
- [**dotnet-framework-4.8-expert**](agents/dotnet-framework-4.8-expert.md) - .NET Framework legacy enterprise specialist
- [**elixir-expert**](agents/elixir-expert.md) - Elixir and OTP fault-tolerant systems expert
- [**expo-react-native-expert**](agents/expo-react-native-expert.md) - Expo and React Native mobile development expert
- [**fastapi-developer**](agents/fastapi-developer.md) - Modern async Python API framework expert
- [**flutter-expert**](agents/flutter-expert.md) - Flutter 3+ cross-platform mobile expert
- [**golang-pro**](agents/golang-pro.md) - Go concurrency specialist
- [**java-architect**](agents/java-architect.md) - Enterprise Java expert
- [**javascript-pro**](agents/javascript-pro.md) - JavaScript development expert
- [**powershell-5.1-expert**](agents/powershell-5.1-expert.md) - Windows PowerShell 5.1 and full .NET Framework automation specialist
- [**powershell-7-expert**](agents/powershell-7-expert.md) - Cross-platform PowerShell 7+ automation and modern .NET specialist
- [**kotlin-specialist**](agents/kotlin-specialist.md) - Modern JVM language expert
- [**laravel-specialist**](agents/laravel-specialist.md) - Laravel 10+ PHP framework expert
- [**nextjs-developer**](agents/nextjs-developer.md) - Next.js 14+ full-stack specialist
- [**php-pro**](agents/php-pro.md) - PHP web development expert
- [**python-pro**](agents/python-pro.md) - Python ecosystem master
- [**rails-expert**](agents/rails-expert.md) - Rails 8.1 rapid development expert
- [**react-specialist**](agents/react-specialist.md) - React 18+ modern patterns expert
- [**rust-engineer**](agents/rust-engineer.md) - Systems programming expert
- [**spring-boot-engineer**](agents/spring-boot-engineer.md) - Spring Boot 3+ microservices expert
- [**symfony-specialist**](agents/symfony-specialist.md) - Symfony 6+/7+/8+ PHP framework and Doctrine ORM expert


### [03. Infrastructure](agents/)
DevOps, cloud, and deployment specialists.

- [**azure-infra-engineer**](agents/azure-infra-engineer.md) - Azure infrastructure and Az PowerShell automation expert
- [**cloud-architect**](agents/cloud-architect.md) - AWS/GCP/Azure specialist
- [**database-administrator**](agents/database-administrator.md) - Database management expert
- [**docker-expert**](agents/docker-expert.md) - Docker containerization and optimization expert
- [**deployment-engineer**](agents/deployment-engineer.md) - Deployment automation specialist
- [**devops-engineer**](agents/devops-engineer.md) - CI/CD and automation expert
- [**devops-incident-responder**](agents/devops-incident-responder.md) - DevOps incident management
- [**incident-responder**](agents/incident-responder.md) - System incident response expert
- [**kubernetes-specialist**](agents/kubernetes-specialist.md) - Container orchestration master
- [**network-engineer**](agents/network-engineer.md) - Network infrastructure specialist
- [**platform-engineer**](agents/platform-engineer.md) - Platform architecture expert
- [**security-engineer**](agents/security-engineer.md) - Infrastructure security specialist
- [**sre-engineer**](agents/sre-engineer.md) - Site reliability engineering expert
- [**terraform-engineer**](agents/terraform-engineer.md) - Infrastructure as Code expert
- [**terragrunt-expert**](agents/terragrunt-expert.md) - Terragrunt orchestration and DRY IaC specialist
- [**windows-infra-admin**](agents/windows-infra-admin.md) - Active Directory, DNS, DHCP, and GPO automation specialist

### [04. Quality & Security](agents/)
Testing, security, and code quality experts.

- [**accessibility-tester**](agents/accessibility-tester.md) - A11y compliance expert
- [**ad-security-reviewer**](agents/ad-security-reviewer.md) - Active Directory security and GPO audit specialist
- [**architect-reviewer**](agents/architect-reviewer.md) - Architecture review specialist
- [**chaos-engineer**](agents/chaos-engineer.md) - System resilience testing expert
- [**code-reviewer**](agents/code-reviewer.md) - Code quality guardian
- [**compliance-auditor**](agents/compliance-auditor.md) - Regulatory compliance expert
- [**debugger**](agents/debugger.md) - Advanced debugging specialist
- [**error-detective**](agents/error-detective.md) - Error analysis and resolution expert
- [**penetration-tester**](agents/penetration-tester.md) - Ethical hacking specialist
- [**performance-engineer**](agents/performance-engineer.md) - Performance optimization expert
- [**powershell-security-hardening**](agents/powershell-security-hardening.md) - PowerShell security hardening and compliance specialist
- [**qa-expert**](agents/qa-expert.md) - Test automation specialist
- [**security-auditor**](agents/security-auditor.md) - Security vulnerability expert
- [**test-automator**](agents/test-automator.md) - Test automation framework expert

### [05. Data & AI](agents/)
Data engineering, ML, and AI specialists.

- [**ai-engineer**](agents/ai-engineer.md) - AI system design and deployment expert
- [**data-analyst**](agents/data-analyst.md) - Data insights and visualization specialist
- [**data-engineer**](agents/data-engineer.md) - Data pipeline architect
- [**data-scientist**](agents/data-scientist.md) - Analytics and insights expert
- [**database-optimizer**](agents/database-optimizer.md) - Database performance specialist
- [**llm-architect**](agents/llm-architect.md) - Large language model architect
- [**machine-learning-engineer**](agents/machine-learning-engineer.md) - Machine learning systems expert
- [**ml-engineer**](agents/ml-engineer.md) - Machine learning specialist
- [**mlops-engineer**](agents/mlops-engineer.md) - MLOps and model deployment expert
- [**nlp-engineer**](agents/nlp-engineer.md) - Natural language processing expert
- [**postgres-pro**](agents/postgres-pro.md) - PostgreSQL database expert
- [**prompt-engineer**](agents/prompt-engineer.md) - Prompt optimization specialist
- [**reinforcement-learning-engineer**](agents/reinforcement-learning-engineer.md) - Reinforcement learning and agent training expert

### [06. Developer Experience](agents/)
Tooling and developer productivity experts.

- [**build-engineer**](agents/build-engineer.md) - Build system specialist
- [**cli-developer**](agents/cli-developer.md) - Command-line tool creator
- [**dependency-manager**](agents/dependency-manager.md) - Package and dependency specialist
- [**documentation-engineer**](agents/documentation-engineer.md) - Technical documentation expert
- [**dx-optimizer**](agents/dx-optimizer.md) - Developer experience optimization specialist
- [**git-workflow-manager**](agents/git-workflow-manager.md) - Git workflow and branching expert
- [**legacy-modernizer**](agents/legacy-modernizer.md) - Legacy code modernization specialist
- [**mcp-developer**](agents/mcp-developer.md) - Model Context Protocol specialist
- [**powershell-ui-architect**](agents/powershell-ui-architect.md) - PowerShell UI/UX specialist for WinForms, WPF, Metro frameworks, and TUIs
- [**powershell-module-architect**](agents/powershell-module-architect.md) - PowerShell module and profile architecture specialist
- [**refactoring-specialist**](agents/refactoring-specialist.md) - Code refactoring expert
- [**slack-expert**](agents/slack-expert.md) - Slack platform and @slack/bolt specialist
- [**tooling-engineer**](agents/tooling-engineer.md) - Developer tooling specialist

### [07. Specialized Domains](agents/)
Domain-specific technology experts.

- [**api-documenter**](agents/api-documenter.md) - API documentation specialist
- [**blockchain-developer**](agents/blockchain-developer.md) - Web3 and crypto specialist
- [**embedded-systems**](agents/embedded-systems.md) - Embedded and real-time systems expert
- [**fintech-engineer**](agents/fintech-engineer.md) - Financial technology specialist
- [**game-developer**](agents/game-developer.md) - Game development expert
- [**iot-engineer**](agents/iot-engineer.md) - IoT systems developer
- [**m365-admin**](agents/m365-admin.md) - Microsoft 365, Exchange Online, Teams, and SharePoint administration specialist
- [**mobile-app-developer**](agents/mobile-app-developer.md) - Mobile application specialist
- [**payment-integration**](agents/payment-integration.md) - Payment systems expert
- [**quant-analyst**](agents/quant-analyst.md) - Quantitative analysis specialist
- [**risk-manager**](agents/risk-manager.md) - Risk assessment and management expert
- [**seo-specialist**](agents/seo-specialist.md) - Search engine optimization expert

### [08. Business & Product](agents/)
Product management and business analysis.

- [**business-analyst**](agents/business-analyst.md) - Requirements specialist
- [**content-marketer**](agents/content-marketer.md) - Content marketing specialist
- [**customer-success-manager**](agents/customer-success-manager.md) - Customer success expert
- [**legal-advisor**](agents/legal-advisor.md) - Legal and compliance specialist
- [**product-manager**](agents/product-manager.md) - Product strategy expert
- [**project-manager**](agents/project-manager.md) - Project management specialist
- [**sales-engineer**](agents/sales-engineer.md) - Technical sales expert
- [**scrum-master**](agents/scrum-master.md) - Agile methodology expert
- [**technical-writer**](agents/technical-writer.md) - Technical documentation specialist
- [**ux-researcher**](agents/ux-researcher.md) - User research expert
- [**wordpress-master**](agents/wordpress-master.md) - WordPress development and optimization expert

### [09. Meta & Orchestration](agents/)
Agent coordination and meta-programming.

- [**agent-installer**](agents/agent-installer.md) - Browse and install agents from this repository via GitHub
- [**agent-organizer**](agents/agent-organizer.md) - Multi-agent coordinator
- [**context-manager**](agents/context-manager.md) - Context optimization expert
- [**error-coordinator**](agents/error-coordinator.md) - Error handling and recovery specialist
- [**github-ops-manager**](agents/github-ops-manager.md) - GitHub operations coordinator for commits, PRs, issues, and releases
- [**it-ops-orchestrator**](agents/it-ops-orchestrator.md) - IT operations workflow orchestration specialist
- [**knowledge-synthesizer**](agents/knowledge-synthesizer.md) - Knowledge aggregation expert
- [**multi-agent-coordinator**](agents/multi-agent-coordinator.md) - Advanced multi-agent orchestration
- [**pdlc-orchestrator**](agents/pdlc-orchestrator.md) - Autonomous Product Development Life Cycle master conductor
- [**sprint-ceremony-manager**](agents/sprint-ceremony-manager.md) - Sprint ceremony coordinator for all Scrum ceremonies
- [**performance-monitor**](agents/performance-monitor.md) - Agent performance optimization
- [**pied-piper**](https://github.com/sathish316/pied-piper/) - Orchestrate Team of AI Subagents for repetitive SDLC workflows
- [**task-distributor**](agents/task-distributor.md) - Task allocation specialist
- [**taskade**](https://github.com/taskade/mcp) - AI-powered workspace with autonomous agents, real-time collaboration, and workflow automation with MCP integration
- [**workflow-orchestrator**](agents/workflow-orchestrator.md) - Complex workflow automation

### [10. Research & Analysis](agents/)
Research, search, and analysis specialists.

- [**research-analyst**](agents/research-analyst.md) - Comprehensive research specialist
- [**search-specialist**](agents/search-specialist.md) - Advanced information retrieval expert
- [**trend-analyst**](agents/trend-analyst.md) - Emerging trends and forecasting expert
- [**competitive-analyst**](agents/competitive-analyst.md) - Competitive intelligence specialist
- [**market-researcher**](agents/market-researcher.md) - Market analysis and consumer insights
- [**data-researcher**](agents/data-researcher.md) - Data discovery and analysis expert
- [**scientific-literature-researcher**](agents/scientific-literature-researcher.md) - Scientific paper search and evidence synthesis via [BGPT MCP](https://github.com/connerlambden/bgpt-mcp)

## 🤖 Understanding Subagents

Subagents are specialized AI assistants that enhance Claude Code's capabilities by providing task-specific expertise. They act as dedicated helpers that Claude Code can call upon when encountering particular types of work.

### What Makes Subagents Special?

**Independent Context Windows**  
Every subagent operates within its own isolated context space, preventing cross-contamination between different tasks and maintaining clarity in the primary conversation thread.

**Domain-Specific Intelligence**  
Subagents come equipped with carefully crafted instructions tailored to their area of expertise, resulting in superior performance on specialized tasks.

**Shared Across Projects**  
After creating a subagent, you can utilize it throughout various projects and distribute it among team members to ensure consistent development practices.

**Granular Tool Permissions**  
You can configure each subagent with specific tool access rights, enabling fine-grained control over which capabilities are available for different task types.

### Core Advantages

- **Memory Efficiency**: Isolated contexts prevent the main conversation from becoming cluttered with task-specific details
- **Enhanced Accuracy**: Specialized prompts and configurations lead to better results in specific domains
- **Workflow Consistency**: Team-wide subagent sharing ensures uniform approaches to common tasks
- **Security Control**: Tool access can be restricted based on subagent type and purpose

### Getting Started with Subagents

**1. Access the Subagent Manager**
```bash
/agents
```

**2. Create Your Subagent**
- Choose between project-specific or global subagents
- Let Claude generate an initial version, then refine it to your needs
- Provide detailed descriptions of the subagent's purpose and activation triggers
- Configure tool access (leave empty to inherit all available tools)
- Customize the system prompt using the built-in editor (press `e`)

**3. Deploy and Utilize**
Your subagent becomes immediately available. Claude Code will automatically engage it when suitable, or you can explicitly request its help:
```
> Have the code-reviewer subagent analyze my latest commits
```

### Subagent Storage Locations

| Type | Path | Availability | Precedence |
|------|------|--------------|------------|
| Project Subagents | `.claude/agents/` | Current project only | Higher |
| Global Subagents | `~/.claude/agents/` | All projects | Lower |

Note: When naming conflicts occur, project-specific subagents override global ones.


## 📖 Subagent Structure

Each subagent follows a standardized template:

```yaml
---
name: subagent-name
description: When this agent should be invoked
tools: Read, Write, Edit, Bash, Glob, Grep
model: sonnet
---

You are a [role description and expertise areas]...

[Agent-specific checklists, patterns, and guidelines]...

## Communication Protocol
Inter-agent communication specifications...

## Development Workflow
Structured implementation phases...
```

### Tool Assignment Philosophy

### Smart Model Routing

Each subagent includes a `model` field that automatically routes it to the right Claude model — balancing quality and cost:

| Model | When It's Used | Examples |
|-------|----------------|----------|
| `opus` | Deep reasoning — architecture reviews, security audits, financial logic | `security-auditor`, `architect-reviewer`, `fintech-engineer` |
| `sonnet` | Everyday coding — writing, debugging, refactoring | `python-pro`, `backend-developer`, `devops-engineer` |
| `haiku` | Quick tasks — docs, search, dependency checks | `documentation-engineer`, `seo-specialist`, `build-engineer` |

You can override any agent's model by editing the `model` field in its frontmatter. Set `model: inherit` to use whatever model your main conversation is using.

### Tool Assignment Philosophy

Each subagent's `tools` field specifies Claude Code built-in tools, optimized for their role:
- **Read-only agents** (reviewers, auditors): `Read, Grep, Glob` - analyze without modifying
- **Research agents** (analysts, researchers): `Read, Grep, Glob, WebFetch, WebSearch` - gather information
- **Code writers** (developers, engineers): `Read, Write, Edit, Bash, Glob, Grep` - create and execute
- **Documentation agents** (writers, documenters): `Read, Write, Edit, Glob, Grep, WebFetch, WebSearch` - document with research

Each agent has minimal necessary permissions. You can extend agents by adding MCP servers or external tools to the `tools` field.

## 🧰 Tools

### [subagent-catalog](tools/subagent-catalog/)
Claude Code skill for browsing and fetching subagents from this catalog.

| Command | Description |
|---------|-------------|
| `/subagent-catalog:search <query>` | Find agents by name, description, or category |
| `/subagent-catalog:fetch <name>` | Get full agent definition |
| `/subagent-catalog:list` | Browse all categories |
| `/subagent-catalog:invalidate` | Refresh cache |

**Installation:**
```bash
cp -r tools/subagent-catalog ~/.claude/commands/
```



## 🤝 Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

- Submit new subagents via PR
- Improve existing definitions
- Report issues and bugs

## Contributor ♥️ Thanks
![Contributors](https://contrib.rocks/image?repo=dipandhali2021/shipwright&max=500&columns=20&anon=1)


## 📄 License

MIT License - see [LICENSE](LICENSE)

This repository is a curated collection of subagent definitions contributed by both the maintainers and the community. All subagents are provided "as is" without warranty. We do not audit or guarantee the security or correctness of any subagent. Review before use, the maintainers accept no liability for any issues arising from their use.

If you find an issue, please [open an issue](https://github.com/dipandhali2021/shipwright/issues) and we'll address it promptly.

