# Agentic CPR — Red Panda 🐼

Sonoxomus integration for the Agentic CPR Chrome extension and background-agent runtime.

## Activate

```bash
bash integrations/agentic-cpr-red-panda/activate.sh --install
```

To start the local Red Panda runtime immediately:

```bash
bash integrations/agentic-cpr-red-panda/activate.sh --run
```

The activation script reconstructs the verified Agentic CPR v0.1.0 package into `integrations/agentic-cpr-red-panda/runtime/` without overwriting Sonoxomus core files.

After activation, load the Chrome extension from:

`integrations/agentic-cpr-red-panda/runtime/agentic-cpr-red-panda/extension`

The local runtime defaults to `http://localhost:8787`.
