import styled from "styled-components"
import media from "styled-media-query"
import AniLink from "gatsby-plugin-transition-link/AniLink"

export const NavPagesWrapper = styled.div`
    body#grid &{
        grid-area: pagination;
    }
    background: var(--color-two);
`
export const NavPagesHeader = styled.div`
    display: flex;
    padding: 2rem;
    justify-content: space-between;
    align-items: center;

    p{
        color: var(--color-text-two);
    }
`
export const NavPagesButton = styled(AniLink)`
    padding: 1rem;
    text-align: center;
    border: 1px solid var(--color-text-two);
    color: var(--color-text-two);
    &:visited{
        color: var(--color-text-two);
    }
    &:hover, &:active{
        background: var(--color-three);
        color: var(--color-text-item-hight);
    }
`
export const NavPagesDisabledButton = styled.label`
    padding: 1rem;
    text-align: center;
    border: 1px solid var(--borders);
    opacity: 0.5;
    border: 1px solid var(--color-three);
    color: var(--color-text-one);

    ${media.lessThan("large")`
        display: none;
    `}

`
export const NavPagesInput = styled.div`
    display: flex;
    padding: 2rem;
    justify-content: center;
    align-items: center;
    p{
        color: var(--color-text-two);
        margin: 0 8px;
    }
    ${media.lessThan("large")`
        p{
            display: none;
        }
    `}
`
export const NavPagesInputPage = styled.input`
    margin: 0 8px;
    padding: 12px;
    border: 1px solid var(--borders);
    color: var(--color-text-item-hight);
    
    background: var(--color-two);

    border: 1px solid var(--color-four);

    &:hover, &:active{
        background: var(--color-three);
    }
    min-width: 100px;
`
export const NavPagesInputSubmit = styled(AniLink)`
    margin: 0 8px;
    padding: 12px;
    border: 1px solid var(--color-four);
    color: var(--color-text-item-hight);

    &:hover, &:active{
        background: var(--color-three);
    }
    &:visited{
        color: var(--color-text-item-hight);
    }
    cursor: pointer;
`