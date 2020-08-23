import styled from "styled-components"
import media from "styled-media-query"

export const SocialWrapper = styled.div`
    ${media.lessThan("large")`
        display: none;
    `}
`

export const SocialContainer = styled.div`
    padding: 2rem 0;
    display: flex;
    justify-content: space-between;
`
export const SocialIconBox = styled.a`
    width: 40px;
    height: 40px;
    margin: 4px;
    transition: all 0.3s ease-in-out;
    *{
        color: var(--color-four);
    }
    &:hover *{
        color: var(--color-text-hight);
    }
    cursor: pointer;

`
