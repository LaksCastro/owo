import styled from "styled-components"
import media from "styled-media-query"
import AniLink from "gatsby-plugin-transition-link/AniLink"

export const NavBarWrapper = styled.nav`
    position: fixed;
    right: 0;
    top: 0;

    width: 3.4375rem;
    height: 100%;
    
    display: flex;
    flex-direction: column;
    justify-content: space-between;


    padding: 1rem 0;

    background: var(--color-one);
    border-left: 1px solid var(--color-three);
    
    .active div *{
        color: var(--color-text-hight);
    }

    ${media.lessThan("large")`
        padding: 0;
        width: 100%;
        height: 3.125rem;
        bottom: 0;
        top: calc(100vh - 3.125rem);
        flex-direction: row;
        border-left: none;
        border-top: 1px solid var(--color-three);
    `}
`
export const NavBarContainer = styled.div`
    ${media.lessThan("large")`
        display: flex;
        align-items: center;
    `}
`
export const NavBarLink = styled(AniLink)`
    cursor: pointer;
    display: flex;
    justify-content: center;
    *{
        color: var(--color-text-two);
    }
    &:hover *{
        color: var(--color-text-hight);
    }
    ${media.lessThan("large")`
        width: 60px;
    `}
`
export const NavBarNotLink = styled.button`
    cursor: pointer;
    width: 100%;
    display: flex;
    justify-content: center;
    
    *{
        color: var(--color-text-two);
    }
    &:hover *{
        color: var(--color-text-hight);
    }

    &.light *{
        color: var(--color-text-hight);
        &:hover{
            opacity: 0.8;
        }
    }
    &.dark *{
        color: var(--color-text-hight);
        &:hover{
            opacity: 0.8;
        }
    }
    ${media.lessThan("large")`
        width: 60px;
        &#visualizacao{
            display: none;
        }
    `}

`
export const NavBarIcon = styled.div`
    width: 30px;
    min-height: 30px;
    padding: 1rem 0;
    ${media.lessThan("large")`
        width: 25px;
    `}
`
