import styled from "styled-components"
import media from "styled-media-query"

export const LayoutWrapper = styled.section`
    display: flex;
`

export const Main = styled.main`
    margin: 0 55px 0 330px;

    min-height: 100vh;

    width: 100%;
    min-width: 0;

    body#grid &{
        grid-template-areas: 
            "posts" 
            "pagination";
    }

    ${media.lessThan("large")`
        margin: 65px 0 50px 0;
    `}
`