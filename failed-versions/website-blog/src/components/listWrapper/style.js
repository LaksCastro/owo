import styled from "styled-components"

export const ListWrapper = styled.section`
    body#grid &{
        background: var(--color-three);
        border-bottom: 1px solid var(--color-three);
        display: grid;
        grid-area: posts;
        grid-gap: 1px;
        grid-template-columns: repeat(auto-fit, minmax(380px, 1fr));
    }
`