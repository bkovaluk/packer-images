IMAGES := common-build common-deploy

# Default target
.PHONY: all
all: build-all

# Target to build all images
.PHONY: build-all
build-all: $(IMAGES)

# Targets for each image
.PHONY: $(IMAGES)
$(IMAGES):
	@echo "Building image: $@"
	@./build_image.sh -i "$@"

# Clean target (if applicable)
.PHONY: clean
clean:
	@echo "Cleaning up..."
	# Add any cleanup commands here

# Help target
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  all            - Build all images"
	@echo "  build-all      - Build all images"
	@echo "  $(IMAGES)      - Build individual images"
	@echo "  clean          - Clean up build artifacts"
	@echo "  help           - Show this help message"
