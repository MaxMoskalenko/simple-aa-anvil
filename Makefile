export PRIVATE_KEY ?= 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
export RPC_URL ?= http://localhost:8545
export CHAIN_ID ?= 31337

PRESETS_DIR = ./presets

.PHONY: localnet
localnet:
	@echo "Starting local Anvil chain..."
	anvil --chain-id $(CHAIN_ID) --accounts 15 --balance 300

.PHONY: neodax
neodax:
	@echo "Deploying NeoDax contracts..."
	@make -C $(PRESETS_DIR)/neodax deploy-all

.PHONY: help
help:
	@echo "Available commands:"
	@echo "  localnet   - Start local Anvil chain"
	@echo "  neodax     - Deploy full NeoDax contract suite"