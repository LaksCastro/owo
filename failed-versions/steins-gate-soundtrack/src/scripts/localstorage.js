function useLocalStorage() {

    function objectToJson(obj) {
        return JSON.stringify(obj)
    }
    function jsonToObject(json) {
        return JSON.parse(json);
    }
    const instance = {
        favorites: localStorage.getItem("favorites") ? jsonToObject(localStorage.getItem("favorites")) : [],

        enum: {
            FAVORITES: "favorites"
        },
        setFavorites: function (favorites) {
            this.storage.set(this.enum.FAVORITES, objectToJson(favorites));
        },
        storage: {
            set: function (key, value) {
                localStorage.setItem(key, value);
            },
        },
    }

    return instance;
}

export default useLocalStorage;