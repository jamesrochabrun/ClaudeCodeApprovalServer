# ClaudeCode Approval Server

A secure MCP (Model Context Protocol) server for handling approval requests in ClaudeCode applications.

## Overview

This package provides an executable MCP server that manages approval workflows for ClaudeCode operations. It's designed to be built from source by consumers for maximum security.

## Security Model

This package follows a **build-from-source** security model:
- No pre-built binaries are distributed
- Consumers compile the server themselves
- Full source code transparency for auditing
- Version pinning for reproducible builds

## Installation

### As a Swift Package Dependency

Add to your `Package.swift`:

```swift
dependencies: [
  .package(url: "https://github.com/jamesrochabrun/ClaudeCodeApprovalServer",
           .exact("1.0.0")) // Pin version for security
]
```

### Building the Executable

```bash
swift build -c release
```

The built executable will be at:
`.build/release/ApprovalMCPServer`

## Integration with ClaudeCodeUI

### For Package Consumers

1. Add this package as a dependency
2. Build the executable in your build phase
3. Provide the path to ClaudeCodeUI via `ApprovalServerProvider`

### For DMG Distribution

The ClaudeCodeUI build script automatically:
1. Clones this repository
2. Builds the executable
3. Bundles it in the app's Resources

## Architecture

The approval server uses Inter-Process Communication (IPC) to:
1. Receive approval requests from Claude Code
2. Forward them to the main application
3. Return user decisions back to Claude Code

## Security Considerations

- Always verify repository authenticity before building
- Pin to specific versions in production
- Audit the source code before deployment
- Consider signing the built executable

## License

MIT License - See LICENSE file for details