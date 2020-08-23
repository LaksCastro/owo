import styled from "styled-components"
import media from "styled-media-query"

export const SearchWrapper = styled.section`
  display: flex;
  flex-direction: column;
  width: 100%;
  transition: opacity 0.4s;

  .ais-InstantSearch__root {
    display: flex;
    flex-direction: column;
    height: auto;
    width: 100%;
  }

  .ais-SearchBox,
  .ais-Stats {
    padding: 0.5rem 2rem;
  }

  .ais-SearchBox {
    padding: 6rem 2rem;
    padding-bottom: 1rem;
    ${media.lessThan("large")`
      padding: 2rem;
    `}
  }

  .ais-Stats {
    color: var(--color-text-two);
  }
  .ais-Hits-item {
    background: var(--color-two);
  }

  body#grid & {
    .ais-Hits-list {
      display: grid;
      background: var(--color-three);
      grid-area: posts;
      grid-gap: 1px;
      grid-template-columns: repeat(auto-fit, minmax(380px, 1fr));
      border-top: 1px solid var(--color-three);
      border-bottom: 1px solid var(--color-three);
      margin-top: 2rem;
    }
  }

  .ais-SearchBox-input {
    display: flex;
    font-size: 1.6rem;
    padding: 1.2rem;
    width: 100%;

    background: var(--color-two);
    border: 1px solid var(--color-three);
    color: var(--color-text-item-hight);
    &:hover, &:active{
      background: var(--color-three);
    }
  }

  .ais-SearchBox-submit,
  .ais-SearchBox-reset {
    display: none;
  }
`
