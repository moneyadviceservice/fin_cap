module NavHelper
  def third_level(title, heading)
    "<div class='third-level'>
      <a href='#' class='return'>#{title}</a>

      <ul>
        <li>
          <div>
            <div class='image'></div>
            <p class='heading'>#{heading}</p>
            <a href='#'>
              <span>Find more </span>
              About #{title}
            </a>
          </div>
        </li>
        <li>
          <p class='heading'>Steering groups &amp; forums</p>

          <ul>
            <li>
              <a href='#'>UK Steering group</a>
            </li>
            <li>
              <a href='#'>Northern Ireland forum</a>
            </li>
            <li>
              <a href='#'>Scotland forum</a>
            </li>
            <li>
              <a href='#'>Wales forum</a>
            </li>
          </ul>
        </li>
      </ul>
    </div>"
  end
end
