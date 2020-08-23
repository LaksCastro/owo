import React from "react"

import Layout from "../components/layout/layout"
import SEO from "../components/seo"
import Search from "../components/search/search"

const SearchPage = () => (
  <Layout>
    <SEO title="Search" />
    <Search />
  </Layout>
)

export default SearchPage
