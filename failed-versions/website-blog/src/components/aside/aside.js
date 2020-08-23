import React from "react"

import Profile from "../profile/profile"
import SocialLinks from "../social-links/social-links"
import NavAside from "../navAside/navAside.js"

import * as S from "./style"

const Aside = () => {
    return(
        <S.AsideWrapper>
            <S.AsideContainer>
                <Profile />   
                <SocialLinks />
                <NavAside />
            </S.AsideContainer>
        </S.AsideWrapper>
    )
}

export default Aside