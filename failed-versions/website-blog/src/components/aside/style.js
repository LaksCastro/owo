import styled from "styled-components"
import media from "styled-media-query"

export const AsideWrapper = styled.aside`
    width: 330px;
    height: 100vh;
    position: fixed;
    padding: 3rem 0;
    background: var(--color-one);
    border-right: 1px solid var(--color-three);

    
    ${media.lessThan("large")`
        width: 100%;
        height: 65px;
        padding: 0;
        border-right: none;
        border-bottom: 1px solid var(--color-three);
    `}
`
export const AsideContainer = styled.aside`
    padding: 0 2rem;
    width: 100%;
    height: 100%;
    text-align: center;
    
    ${media.lessThan("large")`
        padding: 0;
    `}
`
