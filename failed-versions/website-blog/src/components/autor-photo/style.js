import styled from "styled-components"
import media from "styled-media-query"
import Img from "gatsby-image"

export const Imagem = styled(Img)`
    border-radius: 50%;
    width: 85px;
    height: 85px;

    ${media.lessThan("large")`
        width: 35px;
        height: 35px;
    `}
`
export const ImagemWrapper = styled.div`
    display: flex;
    justify-content: center;
    width: 100%;
    min-width: auto;
    ${media.lessThan("large")`
        width: auto;
    `}
`