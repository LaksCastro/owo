import styled from "styled-components"
import AniLink from "gatsby-plugin-transition-link/AniLink"
import media from "styled-media-query"

export const PostItemWrapper = styled(AniLink)`
    display: flex;
    align-items: center;
    cursor: pointer;
    width: 100%;

    background: var(--color-two);
    border-bottom: 1px solid var(--color-three);
    &:hover article *{
        color: var(--color-text-hight);
    }

    padding: 2rem 1rem;
    body#grid &{
        flex-direction: column;
        border: none;
    }

    ${media.lessThan("large")`
        flex-direction: column;
        align-items: flex-start;
    `}
`
export const PostItemImgContainer = styled.div`
    display: flex;
    justify-content: center;
    align-items: center;
    width: 85px;
    height: auto;

    margin: 1rem;
    
    ${media.lessThan("large")`
        width: auto;
    `}
`
export const PostItemImg = styled.article`
    width: 85px;
    height: 85px;
    border-radius: 100%;

    display: flex;
    justify-content: center;
    align-items: center;
    text-decoration: none;

    
    background: ${props => props ? props.backgroundColor : "white" };
    
    font-weight: 900;
    font-size: 1.1em;
    color: ${props => props.text.toUpperCase() === "JS" ? "black" : "white" };
    
    ${media.lessThan("large")`
        width: auto;
        height: auto;
        padding: 12px;
        border-radius: 0;
    `}
`
export const PostItemContent = styled.article`
    width: 100%;
    min-width: 20%;
    padding: 1rem;

    *{
        color: var(--color-text-three);
    }
`
export const PostItemDate = styled.p`

`
export const PostItemTitle = styled.h1`
    font-size: 1.8em;
    margin: 12px 0;
    font-weight: 900;
`
export const PostItemDescription = styled.p`
`