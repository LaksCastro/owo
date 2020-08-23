import styled from "styled-components"
import media from "styled-media-query"

import AniLink from "gatsby-plugin-transition-link/AniLink"

export const NavAsideWrapper = styled.div`
    ${media.lessThan("large")`
        display: none;
    `}
`
export const NavAsideLink = styled(AniLink)`
    text-decoration: none;
    display: block;
    padding: 1rem;
    margin: 4px 0;
    transition: all 0.3s ease-in-out;

    color: var(--color-text-three);

    &:visited{
        color: var(--color-text-three);
    }
    &:hover{
        color: var(--color-text-hight);
        cursor: pointer;
    }
`
export const NavAsideUl = styled.div`
    .active{
        color: var(--color-text-hight);
    }
`