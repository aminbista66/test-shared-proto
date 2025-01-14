# Default values
PROTO_SRC := .
PROTO_OUT := gen

# Get the service name from the command line argument
SERVICENAME := $(SERVICENAME)

# The default target
all: protos

# Generate Protobuf files for the given service
protos:
	@if [ -z "$(SERVICENAME)" ]; then \
		echo "Error: Service name must be provided. Use 'SERVICENAME=service_name'"; \
		exit 1; \
	fi

	@echo "Generating Protobuf files for service: $(SERVICENAME)"

	protoc --proto_path=$(PROTO_SRC) --go_out=. --go-grpc_out=. $(PROTO_SRC)/$(SERVICENAME)/*.proto

# Clean generated files
clean:
	rm -rf $(PROTO_OUT)

.PHONY: protos clean all
