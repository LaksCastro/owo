import styled from "styled-components"
import media from "styled-media-query"
import AniLink from "gatsby-plugin-transition-link/AniLink"

export const ProfileWrapper = styled.div`
    ${media.lessThan("large")`
        display: flex;
        align-items: center;
        height: 100%;
        padding: 16px;
    `}
`
export const ProfileMain = styled(AniLink)`
    padding: 1rem 0;
    color: var(--color-text-three);
    ${media.lessThan("large")`
        display: flex;
        align-items: center;
    `}
    
    &:hover *{
        color: var(--color-text-hight);
    }
    &:active *{
        color: var(--color-text-hight);
    }
`
export const ProfileText = styled(AniLink)`
    ${media.lessThan("large")`
        margin-left: 12px;
    `}
`
export const ProfileTitle = styled.h1`
    padding-top: 1rem;
    font-size: 1.5em;
    color: var(--color-text-three);
    ${media.lessThan("large")`
        font-size: 1.2em;
        padding: 0;
        text-align: left;
    `}
`
export const ProfileOcupacao = styled.h2`
    padding: 1rem 0;
    font-size: 1.1em;
    color: var(--color-text-three);
    ${media.lessThan("large")`
        font-size: 0.9em;
        padding: 0;
        line-height: 0.9em;
    `}
`
export const ProfileDescription = styled.p`
    ${media.lessThan("large")`
        display: none;
    `}
    line-height: 1.3em;
    color: var(--color-text-three)
`