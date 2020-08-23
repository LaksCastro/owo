import React, { useEffect, useState } from "react"

import { Lightbulb } from "styled-icons/typicons/Lightbulb"
import { GridAlt as Grid } from "styled-icons/boxicons-regular/GridAlt"
import { UpArrowAlt as Arrow } from "styled-icons/boxicons-regular/UpArrowAlt"
import { ListAlt as List } from "styled-icons/material/ListAlt"

import getTheme from "../../utils/getTheme"

import Content from "./content"
import * as S from "./style"

const NavBar = () => {
    const [ theme, setTheme ] = useState(null)
    const [ display, setDisplay ] = useState(null)

    const isDark = theme === "dark"
    const isList = display === "list"

    useEffect(() => {
        setTheme(window.__theme)
        setDisplay(window.__display)
        window.__onThemeChange = () => setTheme(window.__theme)
        window.__onDisplayChange = () => setDisplay(window.__display)
    }, [])
    
    return(
        <S.NavBarWrapper>
            <S.NavBarContainer>
                {Content.map((item, i) => {
                const Icon = item.icon
                return(
                    <S.NavBarLink paintDrip color={getTheme()} duration={1} activeClassName="active" title={item.label} to={item.url} key={i}>
                        <S.NavBarIcon>
                            <Icon />
                        </S.NavBarIcon>
                    </S.NavBarLink>
                )})}
            </S.NavBarContainer>
            <S.NavBarContainer>
                <S.NavBarNotLink 
                title="Mudar o tema" 
                onClick={() => {
                    window.__setPreferredTheme(isDark ? "light" : "dark")

                    if (window.DISQUS !== undefined) {
                        window.setTimeout(() => {
                            window.DISQUS.reset({
                                reload: true
                            })
                        }, 300)
                    }
                }} className={theme}>
                    <S.NavBarIcon>
                        <Lightbulb />
                    </S.NavBarIcon>
                </S.NavBarNotLink>
                <S.NavBarNotLink id="visualizacao" title="Mudar o modo de visualização"
                onClick={() => {
                    window.__setPreferredDisplay(isList ? "grid" : "list")
                }} teste={display}>
                    <S.NavBarIcon>
                        {isList ? <Grid /> : <List /> }
                    </S.NavBarIcon>
                </S.NavBarNotLink>

                <S.NavBarNotLink title="Ir para o topo">
                    <S.NavBarIcon>
                        <Arrow />
                    </S.NavBarIcon>
                </S.NavBarNotLink>
            </S.NavBarContainer>
        </S.NavBarWrapper>
    )
}

export default NavBar