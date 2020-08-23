import styled from "styled-components"
import AniLink from "gatsby-plugin-transition-link/AniLink"

export const NavRelWrapper = styled.div`
    display: flex;
`
export const NavRelLinkContainer = styled(AniLink)`
    flex: 1;
    text-align: center;

    display: flex;
    justify-content: center;
    align-items: center;

    border-top: 1px solid var(--color-three);
    border-bottom: 1px solid var(--color-three);

    padding: 2rem;
    
    &:hover{
        background: var(--color-three);
    }
    h2{
        color: var(--color-text-two);
    }
    &:hover h2, &:active h2{
        color: var(--color-text-hight);
    }
    `
export const NavRelLinkText = styled.h2`
    text-align: center;
    font-size: 1.3em;
`

