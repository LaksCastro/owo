import React from "react"

import Content from "./content"

import * as S from "./style"

const SocialLinks = () => {
    return(
        <S.SocialWrapper>
            <S.SocialContainer>
            {Content.map((item, i) => {
            const Icon = item.icon 
            return (
                <S.SocialIconBox title={item.label} target="_blank" href={item.url} key={i}>
                    <Icon />
                </S.SocialIconBox>
            )})}
            </S.SocialContainer>
        </S.SocialWrapper>
    )
}
export default SocialLinks