---
marp: true
theme: default
paginate: true
backgroundColor: #fff
size: 16:9
footer: 'Sponsored by PerfectScale by DoiT • https://perfectscale.io'
---


# Kagent Workshop
## Building Cloud Native AI Agents

![bg right:40% w:400](https://images.pexels.com/photos/8386440/pexels-photo-8386440.jpeg?auto=compress&cs=tinysrgb&w=400)

![Kagent Logo](https://raw.githubusercontent.com/kagent-dev/kagent/main/img/icon-light.svg)

**Hands-On Introduction & Getting Started**

---

## Welcome! 👋

### What We'll Build Today
- Deploy Kagent in Kubernetes
- Create your first AI agent
- Integrate external tools via MCP
- Build automation scenarios

---

## Workshop Timeline (4 Hours)
- **45 min**: AI Agents Fundamentals
- **60 min**: Kagent Setup & First Agents
- **90 min**: Advanced MCP Integration  
- **30 min**: Production & A2A Patterns
- **15 min**: Q&A & Next Steps

---

## 🎯 Lab 0: Environment Check

### Pre-Workshop Checklist

```bash
# Check if tools are installed
kind version
kubectl version --client
helm version
```

### Required
- ✅ **kind**: Local Kubernetes
- ✅ **kubectl**: Kubernetes CLI  
- ✅ **Helm**: Package manager
- ✅ **OpenAI API Key**: For AI functionality

---

## What is Kagent? 🤖

![Kagent Icon](https://raw.githubusercontent.com/kagent-dev/kagent/main/img/icon-light.svg)

**Kagent** = **K**ubernetes + **Agent**ic AI

---

## Why This Workshop Matters

### The Future of Cloud Operations
Modern cloud environments are becoming too complex for manual management. **AI agents** represent the next evolution in operational automation.

### What You'll Learn
By the end of this workshop, you'll understand how to build intelligent agents that can reason, plan, and act autonomously in your Kubernetes environments.

### Ready to Begin?
Let's start by understanding the fundamentals of AI agents...

---

## Part 1: Understanding AI Agents 🤖

![bg right:40% w:350](https://images.pexels.com/photos/8386440/pexels-photo-8386440.jpeg?auto=compress&cs=tinysrgb&w=350)

### What is an AI Agent?

An **AI Agent** is an autonomous system that:
- **Perceives** its environment
- **Reasons** about situations  
- **Takes actions** to achieve goals
- **Learns** from experience

---

## Traditional AI vs AI Agents

### Traditional AI (Chatbots)
```
User Input → LLM → Text Response
```

### AI Agents
```
User Input → Agent → Tools → Environment → Response
           ↗        ↘      ↗
        Memory    Planning   Learning
```

**Key Difference**: Agents can **DO** things, not just **SAY** things

---

## Agent Architecture Deep Dive

![bg right:30% w:250](https://images.pexels.com/photos/8386434/pexels-photo-8386434.jpeg?auto=compress&cs=tinysrgb&w=250)

### Core Components
1. **System Prompt** (The Brain)
2. **Tools** (The Hands) 
3. **Memory** (The Experience)
4. **Planning** (The Strategy)

Let's explore each component...

---

## 1. System Prompts: The Brain 🧠

### What is a System Prompt?
Instructions that define the agent's:
- **Personality** and communication style
- **Capabilities** and limitations
- **Goals** and objectives
- **Safety** rules and constraints

---

## System Prompt Example

### DevOps Agent Prompt
```
You are a Senior DevOps Engineer specializing in Kubernetes.

PERSONALITY: Professional, helpful, safety-focused
CAPABILITIES: K8s troubleshooting, monitoring, automation
GOALS: Solve problems efficiently, prevent downtime
SAFETY: Never delete production resources without confirmation
```

---

## System Prompt Best Practices

### Structure Your Prompts
```
ROLE: Who are you?
CONTEXT: What's your domain?
INSTRUCTIONS: How should you behave?
CONSTRAINTS: What are your limits?
FORMAT: How should you respond?
```

---

## 🧪 Workshop Exercise: Design Your Agent

### Group Activity (10 minutes)

**Design an agent for your organization:**

1. **Role**: What would this agent do?
2. **Tools**: What capabilities would it need?
3. **Safety**: What constraints should it have?
4. **Collaboration**: How would it work with other agents?

**Share your design with the group!**

---

## 2. Tools: The Hands 🛠️

### What are Tools?
Functions that allow agents to:
- **Query** databases and APIs
- **Execute** commands and scripts
- **Manipulate** files and configurations
- **Interact** with external services

---

## Tool Categories

### Example Tool Types
- **Information**: `kubectl get pods`
- **Analysis**: `check_pod_logs`  
- **Action**: `restart_deployment`
- **Communication**: `send_alert`

---

## Tool Types in Practice

### Built-in Tools
```python
def get_kubernetes_pods(namespace="default"):
    """Get list of pods in a namespace"""
    result = kubectl_get("pods", namespace)
    return format_pod_list(result)
```

---

## API Tools Example

### External Service Integration
```python
def query_prometheus(metric, timerange="5m"):
    """Query Prometheus for metrics"""
    response = requests.get(f"{PROM_URL}/api/v1/query", 
                          params={"query": metric})
    return parse_metrics(response.json())
```

---

## 3. MCP: Model Context Protocol 🔗

![bg right:40% w:300](https://images.pexels.com/photos/8386422/pexels-photo-8386422.jpeg?auto=compress&cs=tinysrgb&w=300)

### What is MCP?
A **standard protocol** for connecting AI agents to external tools and data sources.

---

## Why MCP Matters

### Key Benefits
- **Standardization**: Universal tool interface
- **Reusability**: Share tools across agents
- **Extensibility**: Connect to any API
- **Security**: Controlled access patterns

---

## MCP Architecture Flow

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│    Agent    │    │ MCP Server  │    │  External   │
│             │───▶│             │───▶│   Service   │
│ "Get data"  │    │ Translator  │    │    API      │
└─────────────┘    └─────────────┘    └─────────────┘
```

---

## MCP Benefits

### Advantages
- **Agent Independence**: Switch providers easily
- **Tool Ecosystem**: Rich marketplace of tools
- **Maintenance**: Centralized tool management

---

## MCP in Real Scenarios

### Example: Website Research Tool
```json
{
  "name": "fetch_webpage",
  "description": "Fetch and parse webpage content",
  "parameters": {
    "url": "string",
    "parse_mode": "text|html|markdown"
  }
}
```

---

## MCP Usage Flow

### Agent Usage
```
Agent: "Research Kubernetes best practices"
→ MCP Tool: fetch_webpage("https://kubernetes.io/docs/concepts/")
→ Returns: Parsed documentation content
→ Agent: Analyzes and summarizes findings
```

---

## 4. A2A: Agent-to-Agent Communication 🤝

### What is A2A?
**Agent-to-Agent** protocol enables:
- **Collaboration** between specialized agents
- **Delegation** of complex tasks
- **Workflow** orchestration
- **Knowledge** sharing

---

## A2A Real-world Analogy

### Like a Team of Specialists
- **Monitoring Agent** detects issue
- **Analysis Agent** investigates root cause  
- **Remediation Agent** applies fixes
- **Communication Agent** reports status

---

## A2A Communication Patterns

### 1. Sequential Delegation
```
User → Agent A → Agent B → Agent C → Result
```

### 2. Parallel Consultation  
```
        ┌─ Agent B ─┐
User → Agent A       ├─ Synthesis → Result
        └─ Agent C ─┘
```

---

## Hierarchical Orchestration

### 3. Orchestrator Pattern
```
    Orchestrator Agent
    ┌─────┼─────┐
Agent A  Agent B  Agent C
```

### Use Cases
- **Complex workflows** requiring multiple specialties
- **Parallel processing** of different aspects
- **Hierarchical decision making**

---

## A2A Use Case: Incident Response

### Scenario: Application Down
1. **Monitor Agent**: "High error rate detected"
2. **Triage Agent**: "Investigating pod status..."
3. **K8s Agent**: "Pod crash loop, memory limit exceeded"

---

## Incident Resolution Flow

### Continued Response
4. **Remediation Agent**: "Increasing memory limits"
5. **Notification Agent**: "Incident resolved, team notified"

### Benefits
- **Specialized Expertise**: Each agent has domain focus
- **Scalable**: Add agents for new capabilities
- **Auditable**: Clear chain of actions

---

## Memory and Learning in Agents 🧠

![bg right:30% w:250](https://images.pexels.com/photos/11035380/pexels-photo-11035380.jpeg?auto=compress&cs=tinysrgb&w=250)

### Types of Memory
- **Short-term**: Current conversation context
- **Long-term**: Historical interactions and outcomes  
- **Procedural**: Learned workflows and patterns
- **Semantic**: Domain knowledge and facts

---

## Learning Mechanisms

### How Agents Improve
- **Outcome Tracking**: Success/failure patterns
- **User Feedback**: Explicit corrections and ratings
- **Environmental Changes**: Adapting to new conditions

### Continuous Improvement
- Pattern recognition in recurring issues
- Optimization of tool selection
- Refinement of response quality

---

## Agent Planning and Reasoning

### Planning Process
1. **Goal Decomposition**: Break complex tasks into steps
2. **Tool Selection**: Choose appropriate tools for each step
3. **Execution Strategy**: Determine order and dependencies
4. **Error Handling**: Plan for failure scenarios

---

## Planning Example

### Example: "Fix slow application"
```
Plan:
1. Check application metrics (Prometheus tool)
2. Analyze pod resource usage (K8s tool)  
3. Review recent deployments (Git tool)
4. Identify bottlenecks (Analysis tool)
5. Propose optimizations (Knowledge tool)
```

---

## Agent Safety and Governance 🛡️

### Safety Principles
- **Least Privilege**: Minimal necessary permissions
- **Human Oversight**: Critical actions require approval
- **Audit Trails**: Log all agent decisions and actions
- **Rollback Capability**: Ability to undo changes

---

## Governance Framework

### Implementation Structure
- **Role Definitions**: Clear agent responsibilities
- **Approval Workflows**: Multi-stage authorization
- **Monitoring**: Real-time agent behavior tracking
- **Compliance**: Regulatory requirement adherence

---

## 🧪 Hands-on Exercise: Design Your Agent

### Group Activity (10 minutes)

**Design an agent for your organization:**

1. **Role**: What would this agent do?
2. **Tools**: What capabilities would it need?
3. **Safety**: What constraints should it have?
4. **Collaboration**: How would it work with other agents?

**Share your design with the group!**

---

## Part 2: Introduction to Kagent 🚀

![Kagent Logo](https://raw.githubusercontent.com/kagent-dev/kagent/main/img/icon-light.svg)

### Now Let's Build with Kagent!
Time to put AI agent theory into practice with Kubernetes-native agents.

---

## What is Kagent (again)? 

![Kagent Icon](https://raw.githubusercontent.com/kagent-dev/kagent/main/img/icon-light.svg)

**Kagent** = Cloud Native AI Agent Framework

An open-source framework for running AI agents in Kubernetes, automating complex DevOps operations and troubleshooting tasks with intelligent workflows.

---

## The Problem

- K8s troubleshooting takes time
- Complex debugging needs expertise
- Alert fatigue from monitoring
- Repetitive operational tasks
- Limited attention span (i.e for progressive rollouts)

---

## Kagent Solution

![bg right:40% w:350](https://images.pexels.com/photos/8386434/pexels-photo-8386434.jpeg?auto=compress&cs=tinysrgb&w=350)

### Key Benefits
- **AI-powered automation** for cloud-native
- **Natural language interface** for operations
- **Extensible tool ecosystem**
- **Kubernetes-native design**

---

### Cloud Native AI Agents

- Agent creation and deployment
- Tool Provisioning
- MCP Server Management
- Multi-agent Workflows

### Kagent Solution
- Declarative Kubernetes-Native Framework for Agent Deployment
- Multi-Provider Support - Works with OpenAI, Anthropic, Google Vertex AI, Azure OpenAI, Ollama, and custom models
- Tool Integration - Supports MCP tools, built-in Kubernetes tools, and custom HTTP tools
- Agent-to-Agent Communication - Enable sophisticated workflows through A2A

---

## 🏗️ Architecture Overview

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│     CLI     │    │  Dashboard  │    │ Controller  │
└──────┬──────┘    └──────┬──────┘    └──────┬──────┘
       │                  │                  │
       └──────────────────┼──────────────────┘
                          │
                ┌─────────┴─────────┐
                │   App/Engine      │
                │  (AutoGen based)  │
                └───────────────────┘
```

---

## Architecture Components

### Four Main Parts
- **Controller**: Manages K8s custom resources
- **Engine**: Runs AI conversations (Python)
- **CLI**: Developer interface
- **Dashboard**: Web UI

### Built on Proven Tech
- **AutoGen**: Microsoft's agent framework
- **Kubernetes**: Cloud-native orchestration

---

## 🎯 Lab 1: Install Kagent

### Step 1: Create Cluster
```bash
kind create cluster --name kagent-workshop
kubectl cluster-info --context kind-kagent-workshop
```

### Step 2: Set API Key
```bash
export OPENAI_API_KEY="sk-your-openai-key-here"
echo "API Key set: ${OPENAI_API_KEY:0:10}..."
```

---

## Verify your API key works

```bash
curl https://api.openai.com/v1/responses \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d '{
    "model": "gpt-4o-mini",
    "input": "write a haiku about kubernetes",
    "store": true
  }'
```

---

## Install Kagent (continued)
### Step 3: Install CRDs
```bash
# Install Kagent CRDs
helm install kagent-crds oci://ghcr.io/kagent-dev/kagent/helm/kagent-crds \
    --namespace kagent \
    --create-namespace

# Install KMCP CRDs
helm install kmcp-crds oci://ghcr.io/kagent-dev/kmcp/helm/kmcp-crds \
    --namespace kmcp-system \
    --create-namespace
```

---

## Install Kagent (continued)
### Step 4: Download and Configure Kagent
```bash
# Pull and extract Kagent Helm chart
helm pull --untar oci://ghcr.io/kagent-dev/kagent/helm/kagent
cd kagent/
```
### Step 5: Edit Configuration
```bash
# Edit values.yaml to disable unnecessary agents
# Set all agents to enabled=false except:
# - helm agent: enabled=true
# - k8s agent: enabled=true
```
---

## Install Kagent (final step)
### Step 6: Install Kagent
```bash
helm install kagent . --namespace kagent \
    --set providers.openAI.apiKey=$OPENAI_API_KEY
```

### ✅ Verify Installation
```bash
kubectl get pods -n kagent
kubectl get agents -n kagent
# Should show only helm-agent and k8s-agent running
```
---

## 🎯 Lab 2: First Agent

### Launch Dashboard
```bash

kagent dashboard #this won't work on a server
# in your lab:
kubectl port-forward -n kagent --address 0.0.0.0 svc/kagent-ui 8082:80 

```

In your browser - go to http://YOUR_LAB_URL:8082 and click on "Skip wizard"

![bg right:40% w:350](https://i.postimg.cc/VsqDJ7Bz/Screenshot-2025-08-18-at-15-55-18.png)

### Explore Pre-built Agents
- **helm-agent**: Helm management
- **k8s-agent**: Kubernetes operations

---

## 🧪 Try This!

### Test the Helm Agent

**Ask**: "What Helm releases are currently deployed?"

### Expected Flow
1. Agent uses `helm_list_releases` tool
2. Queries your cluster
3. Returns formatted results

### You Should See
- Natural language response
- Tool execution details
- Actual cluster data

---

## 🎯 Lab 3: CLI Interface

### Start Interactive Session
```bash
kagent
# Opens kagent REPL
```

### Key Commands
```bash
kagent >> help          # Show all commands
kagent >> get agents    # List available agents
kagent >> run chat      # Start agent conversation
```

---

## CLI Exercise

### Follow Along
```bash
# List agents
kagent >> get agents

# Start chat
kagent >> run chat
```

### Prompts to Follow
1. **Select**: helm-agent
2. **Session name**: workshop-test  
3. **Task**: "Show me all deployments"

![bg right:30% w:250](https://images.pexels.com/photos/11035471/pexels-photo-11035471.jpeg?auto=compress&cs=tinysrgb&w=250)

---

## Agent Components 🧠

### Agents = Instructions + Tools + Model

![bg right:30% w:250](https://images.pexels.com/photos/8386440/pexels-photo-8386440.jpeg?auto=compress&cs=tinysrgb&w=250)

### 1. **Instructions** (Brain)
- System prompt defining behavior
- Task-specific guidance
- Safety rules and constraints

---

## Agent Components (continued)

### 2. **Tools** (Hands)
- **Built-in**: K8s, Helm, Istio, Prometheus
- **MCP**: External APIs and services  
- **HTTP**: RESTful integrations

### 3. **Model** (Intelligence)
- OpenAI GPT-4o-mini (recommended)
- OpenAI GPT-4o (advanced tasks)
- Azure OpenAI, Anthropic, Google
- Local models via Ollama

---

## 🎯 Lab 4: Custom Agent

### Pod Inspector Agent

Save as `pod-inspector.yaml`:

```yaml
apiVersion: kagent.dev/v1alpha1
kind: Agent
metadata:
  name: pod-inspector
  namespace: kagent
spec:
  description: Specialized pod troubleshooting agent
  modelConfig: default-model-config
```

---

## Pod Inspector (continued)

```yaml
  systemMessage: |-
    You are a Pod Inspector - specialized K8s agent.
    
    🎯 Mission: Help troubleshoot pod issues
    📋 Always check pod status first
    🚨 Never delete without confirmation
    
    Format responses with emojis and sections.
```

---

## Pod Inspector Tools

```yaml
  tools:
  - builtin:
      name: kagent.tools.k8s.GetResources
      type: Builtin
```

### Apply Your Agent
```bash
kubectl apply -f pod-inspector.yaml
```

---

## 🎯 Lab 5: Test Custom Agent

### Find Your Agent
```bash
kagent dashboard
# Look for "pod-inspector"
```

---

## Test Your Pod Inspector

### 🧪 Test Questions
1. **"What pods are in kagent namespace?"**
2. **"Are there any pods with issues?"**  
3. **"Show me resource usage for pods"**

### Expected Results
- ✅ Emojis in responses
- ✅ Structured format
- ✅ Actual cluster data

---

## MCP Tools Introduction 🔧

![bg right:40% w:300](https://images.pexels.com/photos/8386422/pexels-photo-8386422.jpeg?auto=compress&cs=tinysrgb&w=300)

### What is MCP?
**Model Context Protocol** = Standard for connecting AI to external tools

### Why MCP?
- **Extend beyond K8s**: Any API
- **Reuse existing tools**: MCP ecosystem
- **Custom integrations**: Your specific needs

---

## MCP Architecture

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   Kagent    │───▶│ MCP Server  │───▶│ External    │
│   Agent     │    │             │    │ Service/API │
└─────────────┘    └─────────────┘    └─────────────┘
```

### Flow
1. Agent needs external data
2. Calls MCP server via protocol
3. MCP server fetches from API
4. Returns formatted response

---

## 🎯 Lab 6: Deploy MCP Server

### Website Fetcher Server

Save as `mcp-fetcher.yaml`:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mcp-website-fetcher
  namespace: kagent
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mcp-website-fetcher
```

---

## MCP Server (continued)

```yaml
  template:
    metadata:
      labels:
        app: mcp-website-fetcher
    spec:
      containers:
      - name: mcp-website-fetcher
        image: ghcr.io/peterj/mcp-website-fetcher:sha-d2db5b3
        ports:
        - containerPort: 8000
        resources:
          limits:
            cpu: "500m"
            memory: "256Mi"
```

---

## MCP Service

Add to same file:

```yaml
---
apiVersion: v1
kind: Service
metadata:
  name: mcp-website-fetcher
  namespace: kagent
spec:
  selector:
    app: mcp-website-fetcher
  ports:
  - port: 80
    targetPort: 8000
  type: ClusterIP
```

### Deploy
```bash
kubectl apply -f mcp-fetcher.yaml
```

---

## 🎯 Lab 7: MCP Agent

### Website Researcher Agent

Save as `website-agent.yaml`:

```yaml
apiVersion: kagent.dev/v1alpha1
kind: Agent
metadata:
  name: website-researcher
  namespace: kagent
spec:
  description: Agent that fetches and analyzes web content
  modelConfig: default-model-config
```

---

## Website Agent (continued)

```yaml
  systemMessage: |-
    You are a Website Researcher.
    
    🌐 Capabilities:
    - Fetch content from websites
    - Summarize web pages  
    - Extract key information
    
    📋 Always verify URLs before fetching
  tools:
  - type: McpServer
    mcpServer:
      toolServer: website-fetcher-server
      toolNames:
      - fetch
```

---

## ToolServer Configuration

Add to same file:

```yaml
---
apiVersion: kagent.dev/v1alpha1
kind: ToolServer
metadata:
  name: website-fetcher-server
  namespace: kagent
spec:
  description: Fetches website content
  config:
    sse:
      url: http://mcp-website-fetcher.kagent.svc.cluster.local/sse
```

### Deploy
```bash
kubectl apply -f website-agent.yaml
```

---

## 🎯 Lab 8: Test MCP

### Verify Setup
```bash
# Check agent
kubectl get agents -n kagent

# Check tool server  
kubectl get toolservers -n kagent
```

### 🧪 Test Scenarios
1. **"Fetch https://kubernetes.io and summarize"**
2. **"Compare kubernetes.io vs docker.com"**

---

## MCP Flow Verification

### Expected Flow
```
User Query → Agent → MCP Server → Website → Response
```

### Success Indicators
- ✅ Agent finds the fetch tool
- ✅ MCP server connects to website
- ✅ Content returned and summarized
- ✅ Natural language response

![bg right:30% w:250](https://images.pexels.com/photos/270348/pexels-photo-270348.jpeg?auto=compress&cs=tinysrgb&w=250)

---

## 🎯 Lab 9: DevOps Assistant

### Combining Everything

Let's build a complete DevOps assistant that combines:
- Kubernetes tools
- Web research capabilities
- Professional communication

Save as `devops-assistant.yaml`

---

## DevOps Assistant Config

```yaml
apiVersion: kagent.dev/v1alpha1
kind: Agent
metadata:
  name: devops-assistant
  namespace: kagent
spec:
  description: Complete DevOps assistant
  modelConfig: default-model-config
  systemMessage: |-
    Senior DevOps Assistant with K8s + web research.
    
    🎯 Role: Troubleshoot, research, recommend
    🛠️ Process: Analyze cluster → Research docs → Advise
    💡 Style: Professional, clear, actionable
```

---

## DevOps Tools

```yaml
  tools:
  - builtin:
      name: kagent.tools.k8s.GetResources
      type: Builtin
  - builtin:
      name: kagent.tools.k8s.GetAvailableAPIResources
      type: Builtin
  - type: McpServer
    mcpServer:
      toolServer: website-fetcher-server
      toolNames:
      - fetch
```

### Deploy
```bash
kubectl apply -f devops-assistant.yaml
```

---

## 🎯 Lab 10: Advanced Testing

### Complex Scenarios

1. **"Pod keeps restarting. Debug and research best practices."**

2. **"Compare ingress controllers and recommend one."**

3. **"Analyze cluster setup and research resource best practices."**

### Power Features
- Context awareness of your cluster
- Real-time documentation research
- Comprehensive analysis

---

## Production Deployment Strategies

### Scaling Considerations
```yaml
# High Availability Setup
spec:
  replicas: 3
  resources:
    requests:
      cpu: "1000m"
      memory: "2Gi"
    limits:
      cpu: "2000m" 
      memory: "4Gi"
```

### Multi-Environment Setup
- **Development**: Single instance, relaxed permissions
- **Staging**: Production-like, limited blast radius
- **Production**: HA setup, strict governance

---

## Enterprise Integration Patterns

### SSO and Authentication
```yaml
spec:
  auth:
    provider: "oidc"
    endpoint: "https://your-sso.company.com"
    scopes: ["openid", "profile", "groups"]
```

### RBAC Integration
- Map SSO groups to agent permissions
- Fine-grained tool access control
- Audit trail integration

### API Gateway Integration
- Rate limiting per user/agent
- Request/response logging
- Circuit breaker patterns

---

## Observability Setup

### Enable Tracing
```bash
# Deploy Jaeger
kubectl apply -f jaeger-all-in-one.yaml

# Configure Kagent
# Set JAEGER_ENDPOINT in deployment
```

### Monitoring
- Agent response times
- Tool execution metrics
- API usage patterns
- Error rates

### Model Configuration
```bash
# For OpenAI (recommended for workshop)
export OPENAI_API_KEY="sk-your-key"

# Alternative: Create ModelConfig for GPT-4o-mini
kubectl apply -f - <<EOF
apiVersion: kagent.dev/v1alpha1
kind: ModelConfig
metadata:
  name: gpt-4o-mini-config
  namespace: kagent
spec:
  provider: openai
  model: gpt-4o-mini
  apiKey:
    secretRef:
      name: openai-secret
      key: api-key
EOF
```

---

## Advanced Patterns & A2A

### Agent-to-Agent Communication
```yaml
apiVersion: kagent.dev/v1alpha1
kind: Agent
metadata:
  name: orchestrator-agent
spec:
  a2aConfig:
    enabled: true
    skills:
    - id: "k8s-troubleshoot" 
      name: "Kubernetes Troubleshooting"
      description: "Debug cluster issues and apply fixes"
    - id: "performance-analysis"
      name: "Performance Analysis" 
      description: "Analyze metrics and identify bottlenecks"
```

---

## A2A Communication Example

### Multi-Agent Workflow
```
Incident Detection → Triage Agent → Specialist Agents → Resolution
                          ↓              ↓
                    Route to Expert → Apply Domain Knowledge
```

### Benefits
- **Specialized expertise** per domain
- **Scalable architecture** 
- **Clear responsibility chains**
- **Auditable decision trails**

---

## Memory and Context Management

### Persistent Agent Memory
```yaml
spec:
  memory:
    enabled: true
    type: "vector-store"
    retention: "30d"
  contextWindow:
    size: 32000
    strategy: "sliding"
```

### Learning Capabilities
- **Conversation history** retention
- **Outcome tracking** for continuous improvement
- **Domain knowledge** accumulation
- **User preference** learning

---

## Troubleshooting 🔍

### Agent Not Responding
```bash
kubectl logs -n kagent deployment/kagent
kubectl get modelconfigs -n kagent
```

### MCP Issues
```bash
kubectl port-forward svc/mcp-website-fetcher 8000:80 -n kagent
curl http://localhost:8000/sse
kubectl describe toolserver website-fetcher-server -n kagent
```

---

## Next Steps 📈

### This Week
1. Deploy in your real clusters
2. Create domain-specific agents
3. Integrate existing tools

### This Month  
1. Build custom MCP servers
2. Implement A2A patterns
3. Set up observability

### Next Quarter
1. Production deployment
2. Custom tool ecosystem
3. Team training & adoption

---

## Resources 🌟

![Kagent Logo](https://raw.githubusercontent.com/kagent-dev/kagent/main/img/icon-light.svg)

### Official Kagent Resources
- **📖 Docs**: [kagent.dev/docs](https://kagent.dev/docs)
- **💻 GitHub**: [github.com/kagent-dev/kagent](https://github.com/kagent-dev/kagent)  
- **💬 Discord**: [discord.gg/Fu3k65f2k3](https://discord.gg/Fu3k65f2k3)

### Related Technologies
- **MCP Spec**: [modelcontextprotocol.io](https://modelcontextprotocol.io)
- **AutoGen**: [microsoft.github.io/autogen](https://microsoft.github.io/autogen)

---

## Q&A 💬

### Common Questions

**Q: Private clusters?**  
A: Yes! Only OpenAI API calls go external.

**Q: Costs?**  
A: GPT-4o-mini is very cost-effective for learning and development.

**Q: Security?**  
A: Very secure - you control all components.

**Q: Multiple LLM providers?**  
A: Yes! OpenAI, Azure OpenAI, Anthropic, Google, Ollama supported.

---

## Your Questions?

![bg right:40% w:300](https://images.pexels.com/photos/356079/pexels-photo-356079.jpeg?auto=compress&cs=tinysrgb&w=300)

Let's discuss:
- Your specific use cases
- Integration challenges  
- Deployment scenarios
- Custom requirements

---

## Thank You! 🙏

![bg right:40% w:300](https://images.pexels.com/photos/1181677/pexels-photo-1181677.jpeg?auto=compress&cs=tinysrgb&w=300)

![Kagent Logo](https://raw.githubusercontent.com/kagent-dev/kagent/main/img/icon-light.svg)

### Kagent Workshop Complete!
You now have the foundation to build powerful AI agents for Kubernetes.

### Keep Building
- Experiment with real use cases
- Join the Discord community
- Contribute back to the project

**Happy Building! 🚀**