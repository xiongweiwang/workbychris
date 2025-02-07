import PropTypes from 'prop-types';
function Header({ text, textColor, bgColor }) {
  const headerStyle = {
    color: textColor,
    backgroundColor: bgColor,
  };
  return (
    <header style={headerStyle}>
      <div className="container">
        <h2>{text}</h2>
      </div>
    </header>
  );
}

Header.defaultProps = {
  text: 'Hello default Header',
  bgColor: 'rgba(0,0,0,0.4)',
  textColor: '#ff6a95',
};
// proxyConsole.js:64 Warning: Header: Support for defaultProps
// will be removed from function components in a future major release.
// Use JavaScript default parameters instead. Error Component Stack
// function Header({ text = "Hello default Header" }) {

Header.propTypes = {
  text: PropTypes.string,
};

export default Header;
