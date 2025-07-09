FROM docker.n8n.io/n8nio/n8n:1.100.0

# Switch to root to install packages
USER root

# Install langfuse-langchain library
# Using npm install with --global flag to ensure it's available system-wide
RUN npm install -g langfuse-langchain

# Create a non-root user for security (if not already exists)
RUN if ! id -u n8n > /dev/null 2>&1; then \
    addgroup --system --gid 1000 n8n && \
    adduser --system --uid 1000 --ingroup n8n n8n; \
    fi

# Set proper permissions
RUN chmod -R 755 /usr/local/lib/node_modules/langfuse-langchain || true

# Switch back to n8n user for security
USER n8n

# Set working directory
WORKDIR /data

# Health check to ensure n8n is running properly
HEALTHCHECK --interval=30s --timeout=30s --start-period=60s --retries=3 \
  CMD curl -f http://localhost:5678/healthz || exit 1

# Expose the default n8n port
EXPOSE 5678

# Use the same entrypoint as the base n8n image
ENTRYPOINT ["n8n"]