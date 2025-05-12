PRIVATE_KEY ?= 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
RPC_URL ?= http://localhost:8545
CHAIN_ID ?= 31337

TOKEN_NAME ?= Test Token
TOKEN_SYMBOL ?= TST
TOKEN_DECIMALS ?= 18
DEPLOYER_INDEX ?= 77358
MNEMONIC ?= test test test test test test test test test test test junk
SCRIPTS_PATH ?= ../../scripts

localnet:
	@echo "Starting local Anvil chain..."
	anvil --chain-id $(CHAIN_ID) --accounts 15 --balance 300

deploy-erc20: 
	@echo "Deploying ERC20 token with parameters:"
	@echo "  Name: $(TOKEN_NAME)"
	@echo "  Symbol: $(TOKEN_SYMBOL)"
	@echo "  Decimals: $(TOKEN_DECIMALS)"
	@forge script $(SCRIPTS_PATH)/DeployAndFundERC20/DeployAndFundERC20.s.sol \
		--broadcast \
		--rpc-url $(RPC_URL) \
		--sig "run(uint32,string,string,uint8,string)" \
		$(DEPLOYER_INDEX) \
		'"$(TOKEN_NAME)"' \
		'"$(TOKEN_SYMBOL)"' \
		$(TOKEN_DECIMALS) \
		'"$(MNEMONIC)"'

deploy-weth-mock:
	@make deploy-erc20 \
		DEPLOYER_INDEX=77358 \
		TOKEN_NAME="Wrapped Ethereum" \
		TOKEN_SYMBOL="WETH" \
		TOKEN_DECIMALS=18

deploy-usdt-mock:
	@make deploy-erc20 \
		DEPLOYER_INDEX=77359 \
		TOKEN_NAME="Tether USD" \
		TOKEN_SYMBOL="USDT" \
		TOKEN_DECIMALS=6

deploy-usdc-mock:
	@make deploy-erc20 \
		DEPLOYER_INDEX=77360 \
		TOKEN_NAME="USD Coin" \
		TOKEN_SYMBOL="USDC" \
		TOKEN_DECIMALS=6

deploy-all: deploy-weth-mock deploy-usdt-mock deploy-usdc-mock