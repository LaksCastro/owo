const GetTheme = () => {
    const theme = typeof window !== "undefined" && window.__theme

    if(theme === "light") return "white"
    
    if(theme === "dark") return "rgb(20, 20, 20)"
}

export default GetTheme