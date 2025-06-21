var resourceName = "ak4y-vipSystemv2";
if (window.GetParentResourceName) {
	resourceName = window.GetParentResourceName();
}

window.postNUI = async (name = "defaultName", data = {}) => {
	try {
		const response = await fetch(`https://${resourceName}/${name}`, {
			method: "POST",
			headers: {
				"Content-Type": "application/json",
			},
			body: JSON.stringify(data),
		});
		return !response.ok ? null : response.json();
	} catch (error) {
		console.error(error);
	}
};

const app = Vue.createApp({
	data() {
		return {
			general: {
				show: false,
				page: "main-menu",
				selectedCategory: "main-menu",
				plateCustomizationBuying: true,
				allFilters: [],
				showedItems: [],
				customPlate: {
					plateNumber: "",
					platePrice: 20,
					plateState: false,
				},
				basketItemQuantity: 1,
				selectedItemDetail: {},
				searchInput: "",
				redeemInput: "",
			},
			customizeLenghts: {
				minPlate: 6,
				maxPlate: 10,
				minNumber: 6,
				maxNumber: 10,
			},
			notifyArea: {
				show: false,
				message: "Just test",
			},
			boughtPopUp: {
				show: false,
			},
			customizePopUp: {
				show: false,
				menu: "number",
				plateNumber: "AK4YVIP",
				phoneNumber: "0123456",
			},
			buyPopUp: {
				show: false,
			},
			bundlePopUp: {
				show: false,
			},
			charInfo: {
				name: "ak4y Scripts",
				coin: 1000,
				profileImg: "",
			},
			categories: [],
			hotDeals: [],
			buyCoinSection: [],
			translate: {},
			specialOffer: {},
		};
	},
	methods: {
		testDriveClicked() {
			if (this.general.selectedItemDetail.testable) {
				axios.post(`https://${resourceName}/testDrive`, { itemName: this.general.selectedItemDetail.itemName }).then((response) => {
					if (response.data !== true) {
						this.notifyArea.show = true;
						this.notifyArea.message = response.data;
						setTimeout(() => {
							this.notifyArea.show = false;
						}, 2000);
					} else {
						this.general.show = false;
						window.postNUI("closeMenu");
					}
				});
			}
		},
		locateClicked() {
			if (this.general.selectedItemDetail.coords) {
				axios.post(`https://${resourceName}/locate`, { coords: this.general.selectedItemDetail.coords }).then((response) => {
					if (response.data !== true) {
						this.notifyArea.show = true;
						this.notifyArea.message = response.data;
						setTimeout(() => {
							this.notifyArea.show = false;
						}, 2000);
					} else {
						this.general.show = false;
						window.postNUI("closeMenu");
					}
				});
			}
		},

		clickedRedeemButton() {
			if (this.general.redeemInput) {
				axios.post(`https://${resourceName}/redeemCode`, { code: this.general.redeemInput }).then((response) => {
					if (typeof response.data != "number") {
						this.notifyArea.show = true;
						this.notifyArea.message = response.data;
						setTimeout(() => {
							this.notifyArea.show = false;
						}, 2000);
					} else {
						this.charInfo.coin += response.data;
						this.notifyArea.show = true;
						this.notifyArea.message = this.translate.redeemSuccessText;
						setTimeout(() => {
							this.notifyArea.show = false;
						}, 2000);
						this.general.redeemInput = "";
					}
				});
			}
		},

		// Function to handle key events
		buyItemClicked() {
			if (this.general.basketItemQuantity >= 1 && this.general.basketItemQuantity <= 99 && this.general.selectedItemDetail) {
				var price = this.general.selectedItemDetail.discount.state
					? this.general.selectedItemDetail.discount.newPrice
					: this.general.selectedItemDetail.price;
				if (price * this.general.basketItemQuantity > this.charInfo.coin) {
					this.notifyArea.show = true;
					this.notifyArea.message = this.translate.youDontHaveEnoughCoinText;
					setTimeout(() => {
						this.notifyArea.show = false;
					}, 2000);
					return;
				}
				if (this.general.selectedItemDetail.itemType === "plate") {
					if (
						this.customizePopUp.plateNumber.length >= this.customizeLenghts.minPlate &&
						this.customizePopUp.plateNumber.length <= this.customizeLenghts.maxPlate
					) {
					} else {
						this.bundlePopUp.show = false;
						this.buyPopUp.show = false;
						this.notifyArea.show = true;
						this.notifyArea.message = this.translate.plateLengthError;
						setTimeout(() => {
							this.notifyArea.show = false;
						}, 2000);
						return;
					}
				}
				if (this.general.selectedItemDetail.itemType === "number") {
					if (
						this.customizePopUp.phoneNumber.length >= this.customizeLenghts.minNumber &&
						this.customizePopUp.phoneNumber.length <= this.customizeLenghts.maxNumber
					) {
					} else {
						this.bundlePopUp.show = false;
						this.buyPopUp.show = false;
						this.notifyArea.show = true;
						this.notifyArea.message = this.translate.numberLengthError;
						setTimeout(() => {
							this.notifyArea.show = false;
						}, 2000);
						return;
					}
				}
				const itemDetail = {
					id: this.general.selectedItemDetail.id,
					pageValue: this.general.selectedItemDetail.pageValue ? this.general.selectedItemDetail.pageValue : this.general.page,
					giveItems: this.general.selectedItemDetail.giveItems ? this.general.selectedItemDetail.giveItems : null,
					itemName: this.general.selectedItemDetail.itemName ? this.general.selectedItemDetail.itemName : null,
					itemType: this.general.selectedItemDetail.itemType,
					itemCount: this.general.selectedItemDetail.itemCount ? this.general.selectedItemDetail.itemCount : 1,
					jobGrade: this.general.selectedItemDetail.jobGrade ? this.general.selectedItemDetail.jobGrade : null,
					coords: this.general.selectedItemDetail.coords ? this.general.selectedItemDetail.coords : null,
					afterPurchaseTrigger: this.general.selectedItemDetail.afterPurchaseTrigger
						? this.general.selectedItemDetail.afterPurchaseTrigger
						: null,
					price: this.general.selectedItemDetail.discount.state
						? this.general.selectedItemDetail.discount.newPrice
						: this.general.selectedItemDetail.price,
					quantity: this.general.basketItemQuantity,
					garage: this.general.selectedItemDetail.garage ? this.general.selectedItemDetail.garage : null,
					customPlate: this.general.customPlate.plateState ? this.general.customPlate : null,
					customizePopUp:
						this.general.selectedItemDetail.itemType === "number" || this.general.selectedItemDetail.itemType === "plate"
							? this.customizePopUp
							: null,
				};
				axios.post(`https://${resourceName}/itemBuy`, itemDetail).then((response) => {
					if (response.data == true) {
						this.boughtPopUp.show = true;
						this.charInfo.coin -= price * this.general.basketItemQuantity;
						this.basketItemQuantity = 1;
					} else {
						this.notifyArea.show = true;
						this.notifyArea.message = response.data;
						setTimeout(() => {
							this.notifyArea.show = false;
						}, 2000);
					}
				});
				this.customizePopUp.show = false;
				this.bundlePopUp.show = false;
				this.buyPopUp.show = false;
			}
		},
		exitClicked() {
			this.general.show = false;
			window.postNUI("closeMenu");
		},
		openLink(link) {
			window.invokeNative("openUrl", link);
		},
		mountedGetData() {
			window.postNUI("getData");
		},

		keyHandler(event) {
			if (event.which == 27) {
				if (this.general.show) {
					this.general.show = false;
					postNUI("closeMenu");
				}
			}
		},
		// Function to handle category change
	},
	computed: {
		getSpecialOffer() {
			if (Object.keys(this.specialOffer).length === 0) {
				return false;
			}

			if (this.specialOffer.discount.state) {
				const percentage = Math.floor(((this.specialOffer.price - this.specialOffer.discount.newPrice) / this.specialOffer.price) * 100);
				return {
					...this.specialOffer,
					discountPercentage: percentage,
				};
			} else {
				return this.specialOffer;
			}
		},
		getBuyCoinSection() {
			return this.buyCoinSection.map((coin) => {
				if (coin.discount.state) {
					const discountPercentage = Math.floor(((coin.price - coin.discount.newPrice) / coin.price) * 100);
					return {
						...coin,
						discountPercentage: discountPercentage,
					};
				} else {
					return coin;
				}
			});
		},
		getHotDeals() {
			return this.hotDeals.map((deal) => {
				var item = this.categories
					.find((category) => category.pageValue === deal.hotItemPageValue)
					.items.find((item) => item.id === deal.hotItemId);
				item.pageValue = deal.hotItemPageValue;
				if (item.discount.state) {
					const percentage = Math.floor(((item.price - item.discount.newPrice) / item.price) * 100);
					return {
						...item,
						discountPercentage: percentage,
					};
				} else {
					return item;
				}
			});
		},
		getCategories() {
			return this.categories;
		},
		getCharInfo() {
			return this.charInfo;
		},
		getShowedItems() {
			return this.general.showedItems.map((item) => {
				if (item.discount.state) {
					const percentage = Math.floor(((item.price - item.discount.newPrice) / item.price) * 100);
					return {
						...item,
						discountPercentage: percentage,
					};
				} else {
					return item;
				}
			});
		},
		getselectedItemDetail() {
			if (Object.keys(this.general.selectedItemDetail).length === 0) {
				return false;
			}
			if (this.general.selectedItemDetail.discount.state) {
				const percentage = Math.floor(
					((this.general.selectedItemDetail.price - this.general.selectedItemDetail.discount.newPrice) /
						this.general.selectedItemDetail.price) *
						100
				);
				this.general.selectedItemDetail.discountPercentage = percentage;
			} else {
				this.general.selectedItemDetail.discountPercentage = 0;
			}
			return this.general.selectedItemDetail;
		},
	},
	watch: {
		"general.customPlate.plateNumber": function (val) {
			if (val.length > this.customizeLenghts.maxPlate) {
				this.general.customPlate.plateNumber = this.general.customPlate.plateNumber.slice(0, this.customizeLenghts.maxPlate);
			}
		},

		"customizePopUp.plateNumber": function (val) {
			if (val.length > this.customizeLenghts.maxPlate) {
				this.customizePopUp.plateNumber = this.customizePopUp.plateNumber.slice(0, this.customizeLenghts.maxPlate);
			}
		},

		"customizePopUp.phoneNumber": function (val) {
			if (val.length > this.customizeLenghts.maxNumber) {
				this.customizePopUp.phoneNumber = this.customizePopUp.phoneNumber.slice(0, this.customizeLenghts.maxNumber);
			}
		},

		"buyPopUp.show": function (val) {
			if (val && this.general.customPlate.plateState) {
				if (
					this.general.customPlate.plateNumber.length >= this.customizeLenghts.minPlate &&
					this.general.customPlate.plateNumber.length <= this.customizeLenghts.maxPlate
				) {
				} else {
					this.general.customPlate.plateState = false;
					this.bundlePopUp.show = false;
					this.buyPopUp.show = false;
					this.notifyArea.show = true;
					this.notifyArea.message = this.translate.plateLengthError;
					setTimeout(() => {
						this.notifyArea.show = false;
					}, 2000);
					return;
				}
			}
		},

		"general.page": function (val) {
			const selectedCategory = this.categories.find((category) => category.pageValue === val);
			if (selectedCategory) {
				this.general.selectedCategory = selectedCategory.categoryType;
				this.general.showedItems = selectedCategory.items;
				this.general.selectedItemDetail = this.general.showedItems[0];

				this.general.allFilters = [];
				this.general.showedItems.forEach((item) => {
					if (item.filter && !this.general.allFilters.some((filter) => filter.label === item.filter)) {
						this.general.allFilters.push({ label: item.filter, state: false });
					}
				});
			}
		},

		"general.basketItemQuantity": function (val) {
			if (val < 1) {
				this.general.basketItemQuantity = 1;
			} else if (val > 99) {
				this.general.basketItemQuantity = 99;
			}
		},

		"general.searchInput": function (val) {
			if (val) {
				this.general.showedItems = this.categories.find((category) => category.pageValue === this.general.page).items;
				this.general.showedItems = this.general.showedItems.filter((item) => {
					return item.label.toLowerCase().includes(val.toLowerCase());
				});
			} else {
				this.general.showedItems = this.categories.find((category) => category.pageValue === this.general.page).items;
			}
		},

		"general.selectedItemDetail": function (val) {
			if (val) {
				if (Object.keys(val).length !== 0) {
					this.general.basketItemQuantity = 1;
				}
			}
		},

		"general.allFilters": {
			handler(newVal) {
				const isAnyFilterTrue = newVal.some((filter) => filter.state);
				if (!isAnyFilterTrue) {
					this.general.showedItems = this.categories.find((category) => category.pageValue === this.general.page).items;
				} else {
					const filteredItems = this.categories
						.find((category) => category.pageValue === this.general.page)
						.items.filter((item) => {
							return this.general.allFilters.some((filter) => {
								if (filter.state) {
									return item.filter === filter.label;
								}
							});
						});
					this.general.showedItems = filteredItems;
				}
			},
			deep: true,
		},
	},
	mounted() {
		window.addEventListener("message", (event) => {
			if (event.data.action == "init") {
				this.categories = event.data.config.Categories;
				this.buyCoinSection = event.data.config.buyCoin;
				this.translate = event.data.config.Translate;
				this.specialOffer = event.data.config.specialOffer;
				this.customizeLenghts = event.data.config.customizeLenghts;
				this.hotDeals = event.data.config.hotDeals;
				this.general.customPlate.platePrice = event.data.config.CustomPlatePrice;
				this.general.plateCustomizationBuying = event.data.config.CustomPlateDruingPurchase;
			} else if (event.data.action == "openMenu") {
				this.general.show = true;
				this.charInfo.name = event.data.plyInfo.playerName ? event.data.plyInfo.playerName : this.charInfo.name;
				this.charInfo.profileImg = event.data.plyInfo.profileImage ? event.data.plyInfo.profileImage : this.charInfo.profileImg;
				this.charInfo.coin = event.data.plyInfo.coinAmount;
				console.log("Menu opened");
			}
		});
		window.addEventListener("keyup", this.keyHandler);
		window.postNUI("getData");
	},
}).mount("#app");
